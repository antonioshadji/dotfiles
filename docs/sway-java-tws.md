# Sway & Java Applications (TWS / Swing / AWT) Configuration Notes

This document explains why Java GUI applications (like Interactive Brokers Trader Workstation / **TWS**) exhibit broken or disappearing popup menus, dropdowns, and dialogs under **Sway**, and how to configure Sway and the Java environment to fix them.

---

## 1. Root Causes

1. **Non-Reparenting Window Manager Issue**:
   Java AWT/Swing was built assuming traditional X11 reparenting window managers (such as GNOME/Metacity or KDE/KWin). Sway is a **non-reparenting** window manager. Without explicit configuration, Java miscalculates popup/menu coordinates, renders blank windows, or immediately closes transient windows upon creation.

2. **Broad Sway Matching Rules**:
   In Sway/i3, rules like `assign [class="install4j-jclient-Launcher"] workspace number 9` match **every** X11 window created by TWS, including popups, dropdowns, combo boxes, and tooltips. When a menu opens, Sway intercepts it as a managed container window and attempts to route or tile it, breaking the popup lifecycle.

3. **Focus Stealing**:
   When a popup window appears, Sway may automatically transfer focus to it. Java detects focus change on the parent window and immediately dismisses the popup.

---

## 2. Sway Configuration (`~/.config/sway/config`)

### A. Restrict Workspace Assignment to Normal Windows
Ensure `assign` rules only match normal/main application windows rather than popups:

```sway
# Route main TWS window only to workspace 9
assign [class="install4j-jclient-Launcher" window_type="normal"] workspace number 9
```

### B. Disable Automatic Focus on Menus and Popups (`no_focus`)
Prevent Sway from stealing focus when popups, tooltips, or dropdowns spawn:

```sway
no_focus [window_type="popup_menu"]
no_focus [window_type="dropdown_menu"]
no_focus [window_type="menu"]
no_focus [window_type="tooltip"]
no_focus [class="install4j-jclient-Launcher" window_type="utility"]
no_focus [class="install4j-jclient-Launcher" window_type="dialog"]
```

### C. Force Popups and Dialogs to Float
Ensure transient windows and Java AWT dialog peers float instead of tiling:

```sway
for_window [window_type="popup_menu"] floating enable
for_window [window_type="dropdown_menu"] floating enable
for_window [window_type="menu"] floating enable
for_window [window_type="tooltip"] floating enable
for_window [window_type="dialog"] floating enable
for_window [window_type="utility"] floating enable
for_window [class="install4j-jclient-Launcher" instance="sun-awt-X11-XDialogPeer"] floating enable
```

---

## 3. Java Environment Variables (Crucial)

Set the `_JAVA_AWT_WM_NONREPARENTING` environment variable so Java's AWT toolkit properly adapts to non-reparenting Wayland/Sway compositors.

### Option 1: Global User Environment (Recommended)
Add to `~/.bashrc`, `~/.profile`, or `~/.pam_environment`:

```bash
export _JAVA_AWT_WM_NONREPARENTING=1
```

### Option 2: Application Launcher Wrapper
If launching TWS via a desktop entry or custom script:

```bash
env _JAVA_AWT_WM_NONREPARENTING=1 /path/to/tws
```

---

## 4. Debugging & Inspecting Window Criteria

To inspect properties (`class`, `instance`, `window_type`, `window_role`, `title`) of any window or popup created by TWS:

### Live Event Monitoring
Run in a terminal and interact with TWS:
```bash
swaymsg -t subscribe -m '["window"]'
```

### Tree Inspection
Query currently active windows:
```bash
swaymsg -t get_tree | grep -A 15 -B 5 "install4j"
```

---

## 5. Additional Troubleshooting

* **Focus Follows Mouse**: If popups close when moving the mouse across window borders, consider setting `focus_follows_mouse no` in `~/.config/sway/config`.
* **Sway Config Reload**: After editing the configuration, reload Sway in-place using `$mod+Shift+c` (or run `swaymsg reload`).
