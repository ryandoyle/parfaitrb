# parfaitrb
Work-in-progress Ruby library for exposing metrics through to PCP

### Architecture
Currently, only the low-level MMV classes have been implemented. This is the architecture
that I had in mind and allows for different possible metrics writer implementations. Currently
the library uses `libffi` and calls into `limpcp_mmv`, letting it deal with writing the MMV file.
This *probably* should be replaced with an implementation that knows the MMV format directly so
there isn't a dependency on `libpcp_mmv`.

I haven't seen a native Ruby way to open a file as a memory mapped like there is in Java and golang. 
There are gems around that allow this behaviour but they are still wrappers calling out to libc
 `mmap()` and require native compilation. This is probably the best way to go though.


```
|===============================================
|    High-level metrics (Counter/Gauge/etc..)  |
================================================
                     |
                     v
          =======================      ===================
          |       Registry      | ---> |  Metrics Writer |
          =======================      ===================
                                         /       |       \
                                        /        v        \
                             ============   =============   ================
                             | MMVIndom |   | MMVMetric |   | MMVInstances |
                             ============   =============   ================                       
```

