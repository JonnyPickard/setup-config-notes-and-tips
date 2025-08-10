> Be careful using these as they can eat some unexpected things.

| Finds & Replaces | Regex |
|------------------|-------|
| `// Comment` | `\/\/.*$` |
| `/* Comment */` | `\/\*[\w\'\s\r\n\*]*\*\/` |
| New line |  `\r?\n` or `\r`|
