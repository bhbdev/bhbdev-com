---

title: 'Zuri'
date: 2025-01-14T16:14:00-05:00
draft: true

hideMeta: true
ShowBreadCrumbs: true

---

### Rules Engine

This was an interesting project that was one of the first things I built with a couple other devs in Golang. The goal was to create a microservice that would support a larger project involved with collecting and matching user data against various rule sets.


For instance, say you have a site or landing page that presents a user with a series of forms. Each of these forms input determines the next set of fields to display, eventually filtering down to an intended target. The rules engine would simply process the inputs in between requests and return true/false responses.

During any given campaign, one may have several rules and paths to funnel leads into their intended destination. Often, one may find that some rules just don't work, are too strict, or just don't procure the right results. To handle the discovery and analyze what worked and what did not, we could cache false responses and run static analysis with the given input and rules to determine the reasons rules were failing to match or vice versa. Cool 😎

The actual rules were being defined with something like react-querybuilder to generate CEL, expr or similar expressions.  This came with an interesting problem of needing to store the structure for the UI rule builder, along with saving the actual expression to be used in the rules engine else some way to translate between the two. I wrote an initial parser to handle the conversion between the two formats. 

<div style="font-size:.9rem;">
<p style="margin:1rem 0 0">RQB JSON</p>

<div style="height:30rem;border-radius:.5rem; overflow:auto">

```
{
  "combinator": "and",
  "not": false,
  "rules": [
    {
      "field": "firstName",
      "value": "Stev",
      "operator": "beginsWith"
    },
    {
      "field": "lastName",
      "value": "Vai, Vaughan",
      "operator": "in"
    },
    {
      "field": "age",
      "value": "4,55",
      "operator": "between"
    },
    {
      "field": "age",
      "operator": ">",
      "value": "5"
    },
    {
      "combinator": "or",
      "rules": [
        {
          "field": "isMusician",
          "operator": "=",
          "value": true
        },
        {
          "field": "instrument",
          "operator": "=",
          "value": "Guitar"
        }
      ]
    },
    {
      "field": "groupedField1",
      "operator": "=",
      "value": "groupedField2",
      "valueSource": "field"
    },
    {
      "field": "birthdate",
      "operator": "notBetween",
      "value": "1954-10-03,1960-06-06"
    },
    {
      "field": "job",
      "operator": "=",
      "valueSource": "value",
      "value": "developer"
    },
    {
      "rules": [
        {
          "field": "instrument",
          "operator": "=",
          "valueSource": "value",
          "value": "Cowbell"
        },
        {
          "field": "alsoPlays",
          "operator": "in",
          "valueSource": "value",
          "value": "Cowbell,More cowbell,Spoon,Wooden fish,Ocarina"
        }
      ],
      "combinator": "or",
      "not": false
    }
  ]
}
```
</div>

<p style="margin:1rem 0 0">to expr</p>

```
firstName startsWith "Stev"
 and (lastName in ["Vai"," Vaughan"])
 and (age >= 4 and age <= 55)
 and age > 5
 and (isMusician == true or instrument == "Guitar")
 and groupedField1 == groupedField2
 and (birthdate < "1954-10-03" and birthdate > "1960-06-06")
 and job == "developer"
 and (instrument == "Cowbell" or (alsoPlays in ["Cowbell","More cowbell","Spoon","Wooden fish","Ocarina"]))
```

</div>

While that was kinda fun, more interesting stuff probably runs around how to cache responses and run analysis on them. Enter Redis and Temporal.io. With a need to store evaluations and instance data to be replayed, Redis fits the bill. We can store the rule along with a snapshot of instance data. 🙌

Doing analysis synchronously is not ideal, we'd like to have these kinds of things handled in the background.  [Temporal.io](https://temporal.io) is a pretty nifty platform and workflow engine of sorts that lets you do lots of super cool things with resilience. It guarantees your application code executes reliably, even during network outages or server crashes, and is designed for managing stateful workflows. Nice!  We use this to process evaluations in a separate thread outside of the main application for later consumption.  Bravo 💪

All in, this was a neat little microservice that kickstarted and became a part of a much larger monolith project that I'm proud to say I contributed to.


