mogilefs-sandbox
===

setup
---

1. bundle install
1. bundle exec rake bootstrap

karakuri
---

- mogfs001
  - mogilefs
  - http://mogilefs.org/
- storage001, storage002
  - cmogstored (alternative mogstored implementation for MogileFS)
  - http://bogomips.org/cmogstored/README.html

```text
          +------------+
          |  mogfs001  |
          | ---------- |
          |  mogilefs  |
          +------------+
                |
      +---------+----------+
      |                    |
+------------+      +------------+
| storage001 |      | storage002 |
| ---------- |      | ---------- |
| cmogstored |      | cmogstored |
+------------+      +------------+
```
