

## defaults

### default properties

- id:'***'
- name: ...
- tags: ...
- description: ...

### default actions

- !$rootobject.delete
- !$rootobject.list
  - namefilter, use filter statements on name of the rootobject
  - includefilter, use filter statements on tags of the rootobject
  - excludefilter, use filter statements on tags
- !!!!$rootobject.print
  - macro to print the content of rootobject, super useful for debug
  - namefilter, use filter statements on name of the rootobject
  - includefilter, use filter statements on tags of the rootobject
  - excludefilter, use filter statements on tags
  - properties:
    - print all properties by default
    - but if specified then only print specified properties
  - format: 3script, wiki, json (3script default)
- !$rootobject.comment (will link to rootobject)
  - comment
  - author