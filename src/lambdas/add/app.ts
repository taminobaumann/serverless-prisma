import _ from 'lodash';
import {createPrismaClient} from '@libs/createPrismaClient';

exports.handler = async () => {
  const arr1 = [1,2,3];
  const updatedArr  = _.concat(arr1, 4, 5);
  console.log(updatedArr);

  const prisma = createPrismaClient();

  try {
    await prisma.user.create({
      data: { uuid: new Date().toString() },
    });
  } catch (e) {
    console.error(e);
  }

  return prisma.$disconnect();
}
