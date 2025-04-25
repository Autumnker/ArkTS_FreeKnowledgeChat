import { MsgInterface } from "../../model/message"
import { Params } from "../../model/params"
import { PersonInterface } from "../../model/person"
import { router } from "@kit.ArkUI"

export function JumpToChatPage(person:PersonInterface, message:MsgInterface[]){
  const friend_example:PersonInterface={name:person.name, icon:person.icon}
  const me_example:PersonInterface={name:'admin', icon:$r('app.media.chatAvatar7')}
  const dataPass:Params = {
    friend:friend_example,
    me:me_example,
    msg:message
  }
  router.pushUrl({
    url:'commonViews/chatPage',
    params:dataPass
  })
}