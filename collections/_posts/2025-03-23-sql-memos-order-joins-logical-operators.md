---
date: 2025-03-23 23:19:00 +0300
title: "SQL Memos: Order, Joins, Logical Operators"
description: "Basic SQL references I keep coming to again and again."
tags: [SQL]
image: "/images/posts/post-4/wildcards.png"
---

It's going to be an infographic post.
While preparing for a test, I revisited the main concepts of SQL and realized that there are some **memos I find especially useful.**

**Here they are:**

[Order of Query vs Order of Execution](#order-of-query-vs-order-of-execution)

[SQL Joins in Venn diagrams](#sql-joins-in-venn-diagrams)

[Logical operators and wildcards](#logical-operators-and-wildcards)

## Order of Query vs Order of Execution

I was surprised when I first learned that `SELECT` is executed toward the end. Now I know better.

![Image showing order of querying and execution](/images/posts/post-4/order-of-querying-execution.png){: .center width="600" height="auto"}

It also helped me understand why I can’t use aliases in `WHERE` or `HAVING`, like here:

```sql
SELECT name,
        COUNT(order_id) AS total_orders
FROM random_table
GROUP BY name
HAVING total_orders > 1 -- Alias can't be used, because query doesn't know about it yet
ORDER BY total_orders -- But by know the alias is already known and can be used
```

<p></p>
So, it should be like this:

```sql
SELECT name,
        COUNT(order_id) AS total_orders
FROM random_table
GROUP BY name
HAVING COUNT(order_id) > 1 -- <= here, the same as in SELECT
ORDER BY total_orders
```

<p></p>

## SQL Joins in Venn diagrams

This one I use quite a lot. Handy, visual, and quick to grasp.

![SQL Joins illustrated in Venn diagrams](/images/posts/post-4/sql-joins.png){: .center width="600" height="auto"}

## Logical operators and wildcards

I just love the fact that some 'cards' are wild. So relatable.

![SQL Logical operators and wildcards](/images/posts/post-4/sql-logical-operators.png){: .center width="600" height="auto"}

---

While brainstorming ideas for this post, I was pleased to realize just how much I covered during the week. I don’t want to clutter the posts by pouring out everything I encountered or learned. Instead, I'll try to focus on the gems, surprises, or things that just caught my attention for some reason.

Next up: [More SQL: Queries for Duplicates and Missing Values](/blog/more-sql-queries-for-duplicates-and-missing-values)

---
