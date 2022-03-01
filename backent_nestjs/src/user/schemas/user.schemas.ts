/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { Prop, Schema, SchemaFactory  } from "@nestjs/mongoose";
import {Document} from "mongoose";

export type UserDocument = User & Document;

@Schema()
export class User{
    @Prop({required:true})
    firstname:String;

    @Prop({required:true})
    lastname:String;

    @Prop()
    address:String;
}

export const UserSchema = SchemaFactory.createForClass(User);