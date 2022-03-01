/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import {MongooseModule} from '@nestjs/mongoose';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { User, UserSchema } from './schemas/user.schemas';

@Module({
  imports: [
    MongooseModule.forFeature([{name: User.name, schema: UserSchema}]),
  ],
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}
