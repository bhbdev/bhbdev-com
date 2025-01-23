---

title: 'Mr. Ed'
date: 2025-01-14T16:14:00-05:00
draft: false

hideMeta: true
ShowBreadCrumbs: true

---

### An "AI-powered" Content Editor

{{< figure class="screenshot" src="/images/mred-1.png" caption="" attr="" attrlink="" >}} 

This was an experimental idea I came up with while working with editors that were creating evergreen content.
Editors would use ChatGPT to generate content and copy/paste to a JSON file to be handed over to developers to import. This proved to be a clunky process, and ripe with potential issues due to the custom importing scripts and editors lack of knowledge about JSON syntax.

Since the editors were already using ChatGPT, the idea was to build an internal intranet type application. One where we could integrate with OpenAI API, and implement a UI interface that would guide and create the same content without the need for special formatting, or custom import scripts internally.

There would be a chat bot agent that had access to various tools within the codebase. Leaning towards agentic and generative actions that would enhance and streamline the editors tasks, all within a single application. The AI would essentially handle the technical aspects of the job.

While I unfortunately did not get a chance to complete this experiment after less than a week, it did make quite the positive effect on other teams I was working with and provided inspiration on the potential of AI and programming. It sparked a newer chat bot prototype which I also worked on that integrated with gRPC and golang backend with [htmgo](https://htmgo.dev) + [HTMX](https://htmx.org) frontend.

Mr. Ed was built with Vue 3, TypeScript, Bootstrap, @ai-sdk/openai

<video src="/images/mred-v1.mov" class="video" controls playbackRate="1.5">
