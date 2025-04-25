import { PersonInterface } from "./person"
import { MsgInterface } from "./message"

export interface Params{
  friend:PersonInterface,
  me:PersonInterface,
  msg:MsgInterface[]
}