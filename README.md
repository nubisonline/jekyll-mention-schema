jekyll-mention-schema
=====================

Jekyll plugin that allows you to mention co-authors using the Schema.org notation for Person.

This requires you to have an authors array in your site config that looks a little like this:

```yaml
authors:
  user1:
    display_name: 1User
    full_name: User von Wanningston
    gplus_id: 118082699456363103031
    position: Senior VP of Jekyll plugins
  otherauth:
    display_name: Otter
    full_name: Othér Auteur
    gplus_id: 118082699456363103031
    position: Blagosphere Watcher
```
