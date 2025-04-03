---
date: 2025-03-24 11:19:00 +0300
title: "More SQL: Queries for Duplicates and Missing Values"
description: "When faced with real-world, less-than-perfect data..."
tags: [SQL]
image: "/images/posts/post-5/overview-duplicates-and-missing.png"
---

Some of the courses I tried in data analytics use clean data to work with, which is nice yet utopian :) That's why whenever I see data cleaning mentioned somewhere, I'm all ears.

As far as I know now, there are three types of data that need to be checked during Data Cleaning process:

1. [Duplicates](#check-for-duplicates-remove-duplicates)
2. [Missing Data](#check-for-missing-data)
3. Outliers

Today I'll touch on the first two types (SQL-wise): queries that I stumbled upon while studying.

## Check for duplicates and Remove duplicates

Here's a simple table with duplicates.

```sql
-- Initial table
SELECT *
FROM category
ORDER BY category_id;
```

<p></p>

![Screenshot - initial table output](/images/posts/post-5/duplicates-00-initial-table.png){: .center width="400" height="auto"}

It has only 2 columns, so in order to check for duplicates we are going to:

- group by both of these columns;
- count number of duplicates (=how many category_id+name combinations);
- filter out those that get count of 1 (=no duplicates).

**I. Checking**

```sql
-- Check for Duplicates
SELECT category_id,
        name,
        COUNT(*) as duplicate_count
FROM category
GROUP BY category_id,
        name
HAVING COUNT(*) > 1
ORDER BY category_id;
```

<p></p>

![Screenshot - checking for duplicates output](/images/posts/post-5/duplicates-01-check.png){: .center width="400" height="auto"}

Removing the duplicates is a bit trickier, but step by step, it's easily digestible.

**II. Removing**

This is the query:

```sql
-- Remove Duplicates
DELETE FROM category
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM category
    GROUP BY category_id,
            name
);
```

<p></p>

**What it does?**

Let's break it down. The `ctid` shows where the row is stored.

```sql
-- Let's see what ctid does
SELECT ctid,
        category_id,
        name
    FROM category;
```

<p></p>

![Screenshot - output with ctid column](/images/posts/post-5/duplicates-02-ctids.png){: .center width="400" height="auto"}

Numbers (0,1), (0,2), ... mean: 0 - page number; 1, 2, etc - row number. Each row is unique, regardless of whether the contents of the rows are identical.

So, when we choose `MIN(ctid)`, it gives first occurence of the category_id+name combination.

```sql
-- See 1st occurence of category_id+name combination
SELECT MIN(ctid),
        category_id,
        name
FROM category
GROUP BY category_id,
        name;
```

<p></p>

![Screenshot - output with MIN ctids](/images/posts/post-5/duplicates-03-min-ctids.png){: .center width="400" height="auto"}

Thus, to delete only duplicates while keeping the first occurence, we use `NOT IN MIN(ctid)`:

```sql
-- Remove Duplicates with CTID
DELETE FROM category
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM category
    GROUP BY category_id,
            name
);
```

<p></p>

```sql
-- Check what we've done
SELECT *
FROM category
ORDER BY category_id;
```

<p></p>

![Screenshot - check if duplicates are deleted, final output](/images/posts/post-5/duplicates-04-final-result.png){: .center width="400" height="auto"}

### Check for Missing Data

Now, consider a table like this:

![Screenshot - table with missing values](/images/posts/post-5/missing-values-00-initial-table.png){: .center width="400" height="auto"}

It's quite straightforward to check for missing values by filtering for NULLs.

```sql
-- Check for missing values
SELECT *
FROM category
WHERE name IS NULL;
```

<p></p>

![Screenshot - output for checking for missing values](/images/posts/post-5/missing-values-01-check.png){: .center width="250" height="auto"}

BUT

Wait, where is the 5th row? It is obviously missing some data as well?

In SQL, NULL represents true absence, while an empty string '' is technically a value — just an empty one. As well as zero. Well, with 0 it's more straightforward — it does take space even for the naked eye, and it is a value. Meanwhile, empty strings can sneak around unnoticed.

So, we need to modify our query a bit:

```sql
-- Check for NULL or Empty Strings
SELECT *
FROM category
WHERE name IS NULL OR TRIM(name) = '';
```

<p></p>

![Screenshot - output for checking for missing values - with empty strings](/images/posts/post-5/missing-values-01-check-with-strings.png){: .center width="400" height="auto"}

Gotcha!

Depending on the quantity, it wight be a good idea to start by just counting them:

```sql
-- Count Missing or Empty Values
SELECT COUNT(*) AS missing_count
FROM category
WHERE name IS NULL OR TRIM(name) = '';
```

<p></p>

![Screenshot - output for counting missing values](/images/posts/post-5/missing-values-02-count.png){: .center width="400" height="auto"}

Once found, **what to do with them?**

- delete
- replace (for example, fill them in with 'n/a' or averages)

I saw a comment that regression can be used to predict values. Haven't tried it yet, but sounds interesting.

Until next time.

---
