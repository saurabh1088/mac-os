# OSLog vs print

---

## Observations

### Running utility on terminal
- On terminal output
    - `print` statements are visible on terminal output when utility is executed.
    - `OSLog` statements are NOT visible. 
- On Xcode console
    - Both `print` and `OSLog` are visible
    
### Running utility using log stream --process
- `print` statements will not be visible using log stream
- `OSLog` statements will be visible using below command

```
log stream --predicate 'subsystem == "com.saurabhverma.OSLogVsPrint"' --info
```

### Console App
- `print` statements are not visible
- `OSLog` statements will be observed and can be filtered by subsystem
