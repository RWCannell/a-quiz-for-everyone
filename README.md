# A Quiz for Everyone
## Introduction
I like general knowledge and I especially enjoy quiz shows and games. This application contains a list of multiple-choice questions where each question has four options, but only one is correct (similar to the British tv game show, [_"Who Wants to be a Millionaire"_](https://en.wikipedia.org/wiki/Who_Wants_to_Be_a_Millionaire%3F_(British_game_show))).

## Architecture
### Database
A PostgreSQL database is used to store the questions and options. For now, there is no _user_ entity. The application is stateless (it may be expanded upon later to include users and to keep a scoreboard for all users who participate). There are three tables, namely **QUESTION**, **OPTION**, and **QUESTION_OPTION**. Here are the data structure of each table, respectively:   

**QUESTION**
```
questionId: string
questionText: string
subject: string
```

**OPTION**
```
optionId: string
optionText: string
questionId: string
```

**QUESTION_OPTION**
```
questionOptionId: string
questionId: string
optionId: string
```

An option has multiple questions, but only one option is correct. The ids of the correct options are stored in the **QUESTION_OPTION** table.

### Client (Frontend)
The frontend is to be built using the [Svelte](https://svelte.dev/docs/introduction) web framework. Both Javascript and Typescript are valid options for the programming language, but I have chosen to use Typescript.   

### Server (Backend)
The backend is to be built using the [Fastify](https://fastify.dev/docs/latest/) library with Typescript as the programming language.