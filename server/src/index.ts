import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';
import gql from 'graphql-tag';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const typeDefs = gql`
  type Task {
    id: ID!
    title: String
    done: Boolean
  }

  type Query {
    tasks: [Task]
  }

  type Mutation {
    addTask(title: String!): Task
    updateTask(id: ID!): Task
  }
`;

interface TaskInput {
  title: string;
}
interface TaskUpdateInput {
  id: string;
}

const resolvers = {
  Query: {
    tasks: async () => await prisma.task.findMany(),
  },
  Mutation: {
    addTask: async (_parent: any, args: TaskInput) => {
      const task = await prisma.task.create({
        data: {
          title: args.title,
        },
      });

      return task;
    },
    updateTask: async (_parent: any, args: TaskUpdateInput) => {
      const task = await prisma.task.findFirst({
        where: {
          id: args.id,
        },
      });

      const updatedTask = await prisma.task.update({
        where: {
          id: task.id,
        },
        data: {
          done: !task.done,
        },
      });

      return updatedTask;
    },
  },
};

const server = new ApolloServer({
  typeDefs,
  resolvers,
});

const { url } = await startStandaloneServer(server, {
  listen: { port: 4000 },
});

console.log(`🚀  Server ready at: ${url}`);
