 (current-library-collection-paths
    (cons
       (build-path (find-system-path 'addon-dir) (version) "collects")
       (current-library-collection-paths)))
