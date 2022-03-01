/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable prettier/prettier */
import { Prop, Schema, SchemaFactory  } from "@nestjs/mongoose";
import {Document} from "mongoose";

export type ProductDocument = Product & Document;

@Schema()
export class Product{
    @Prop({required:true})
    name:String;

    @Prop({required:true})
    price:number;

    @Prop({required:true})
    quantity:number;

    @Prop()
    image:String;
}
export const ProductSchema = SchemaFactory.createForClass(Product);
