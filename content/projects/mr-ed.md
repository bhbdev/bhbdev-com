---

title: 'Mr. Ed'
date: 2025-01-14T16:14:00-05:00
draft: true

hideMeta: true
ShowBreadCrumbs: true

---

### Content Editor Assistant

{{< figure class="screenshot" src="/images/mred-1.png" caption="" attr="" attrlink="" >}} 

**This was an *experimental* idea** I came up with while working with editors creating evergreen content to be inserted into an legacy production system.

Editors would use ChatGPT to generate content articles and then copypasta to a JSON file to be handed over to developers to import using custom scripts.  This proved to be a clunky process, and ripe with potential issues due to the need for custom scripts and editors lack of knowledge about JSON syntax.

Since the editors were already using ChatGPT, the idea was to build an internal intranet application that could interface with the legacy system. One where we could integrate with OpenAI's API or similar, and implement a UI chat interface that would guide and generate the same content without the need for special formatting or custom import scripts internally.

There would be a chat bot assistant with access to various tools within the codebase. Lending itself to actions that would enhance and streamline the editors (and developers) tasks, all within a single place. The LLM would essentially handle the technical aspects of the job.

Mr. Ed was a quick prototype built with Vue 3, TypeScript, Bootstrap, @ai-sdk/openai. Ultimately, it influenced another chat integration implemented under a Go (golang) backend using gRPC and [htmgo](https://htmgo.dev) with an [HTMX](https://htmx.org) powered frontend.



<video src="/images/mred-v1.mov" class="video" controls playbackRate="1.5">
