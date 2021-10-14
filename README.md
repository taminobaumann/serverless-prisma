## Serverless Prisma

Starting setup for a Serverless Prisma project in TypeScript running on AWS Lambda with the Serverless Framework at it's backbone.

### Requirements

- AWS Account
- AWS cli configured locally
- SQL or MongoDB database


### Structure

- `src/lambas` holds all your lambda handlers related code
- `src/libs` holds general code available to all lambda functions
- imports from `src/libs` as `import {name} from @libs`
- access to prisma client inside your code through `import {createPrismaClient} from @libs`

### Build
- The build process creates three different lamba layers to keep your actual function code as small as possible
  1. Prisma -> holding your prisma-client related code
  2. NodeModules -> holding your prod node-modules
  3. Lib -> holding your shared assets


### Getting started
```bash
$ yarn install 
```

### Setup

- If you don't want to use your default aws profile configured on your local machine for deployment, update `config.js`
- Update `PRISMA_DATABASE_URL` in `.env` file
- Update `prisma.schema` and run migrations if necessary


### Usage

#### Deployment
Creating resources on aws
```bash
$ yarn deploy
```

### Offline
Compiling and building as if in production but execution happens locally
```bash
$ yarn offline
```


