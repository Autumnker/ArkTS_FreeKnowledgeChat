import { GroupChatComponent } from "./chat/groupChat"
import { SingleChatComponent } from "./chat/singleChat"
import { Head } from "./utils/head"
import { SearchComponent } from "./utils/searchComponent"
import { PersonInterface } from '../model/person'
import { exampleMsg1, exampleMsg2, exampleMsg3, exampleMsg4, exampleMsg5 } from '../model/message'
import { JumpToChatPage } from './utils/jumpToChatPage'

@Component
export struct ChatComponent {
  groupChatList1: Resource[] = [
    $r('app.media.nija1'),
    $r('app.media.nija2'),
    $r('app.media.nija3'),
    $r('app.media.nija4'),
    $r('app.media.nija5'),
    $r('app.media.nija6'),
    $r('app.media.nija7'),
    $r('app.media.nija8'),
    $r('app.media.nija9')
  ]
  groupChatList2: Resource[] = [
    $r('app.media.theboys1'),
    $r('app.media.theboys2'),
    $r('app.media.theboys3'),
    $r('app.media.theboys4'),
    $r('app.media.theboys5'),
    $r('app.media.theboys6'),
    $r('app.media.theboys7'),
    $r('app.media.theboys8'),
    $r('app.media.theboys9')
  ]

  build() {
    Column(){
      Row() {
        // 顶栏
        Head({
          text: '聊天',
          icon: $r('app.media.plush')
        })
          .width("100%")
          .height(34)
          .margin({ top:8 })
      }
      .justifyContent(FlexAlign.Center)
      .align(Alignment.Center)

      // 搜索框
      SearchComponent()

      // 消息区域
      // 个人好友
      Row() {
        SingleChatComponent({
          icon: $r('app.media.chatAvatar1'),
          title: '船长',
          subTitle: '起帆'
        })
      }
      .height(48)
      .margin({ top: 4, bottom: 4 })
      .onClick(()=>{
        const friend_example:PersonInterface={name:'船长', icon:$r('app.media.chatAvatar1')}
        JumpToChatPage(friend_example,exampleMsg1)
      })

      SingleChatComponent({
        icon:$r('app.media.chatAvatar2'),
        title:'火车头',
        subTitle:'I can`t stop'
      })
        .height(48)
        .margin({
          top:4,
          bottom:4
        })
        .onClick(()=>{
          const friend_example:PersonInterface={name:'火车头', icon:$r('app.media.chatAvatar2')}
          JumpToChatPage(friend_example,exampleMsg3)
        })

      SingleChatComponent({
        icon:$r('app.media.chatAvatar3'),
        title:'乐神',
        subTitle:'快上车'
      })
        .height(48)
        .margin({
          top:4,
          bottom:4
        })
        .onClick(()=>{
          const friend_example:PersonInterface={name:'乐神', icon:$r('app.media.chatAvatar3')}
          JumpToChatPage(friend_example,exampleMsg2)
        })

      // 群聊
      GroupChatComponent({
        iconList:this.groupChatList1,
        title:'木叶村',
        subTitle:'鸣人:拉面煮好了'
      })
        .height(48)
        .margin({
          top:4,
          bottom:4
        })

      GroupChatComponent({
        iconList:this.groupChatList2,
        title:'黑袍纠察队',
        subTitle:'祖国人:鞭炮再奶我一口'
      })
        .height(48)
        .margin({
          top:4,
          bottom:4
        })

      // 个人好友
      SingleChatComponent({
        icon:$r('app.media.chatAvatar4'),
        title:'爱狗人士',
        subTitle:'快到窝里来'
      })
        .height(48)
        .margin({
          top:4,
          bottom:4
        })
        .onClick(()=>{
          const friend_example:PersonInterface={name:'爱狗人士', icon:$r('app.media.chatAvatar4')}
          JumpToChatPage(friend_example,exampleMsg4)
        })

      SingleChatComponent({
        icon:$r('app.media.chatAvatar5'),
        title:'Autumnker',
        subTitle:'哎~,不如回家种田'
      })
        .height(48)
        .margin({
          top:4,
          bottom:4
        })
        .onClick(()=>{
          const friend_example:PersonInterface={name:'Autumnker', icon:$r('app.media.chatAvatar5')}
          JumpToChatPage(friend_example,exampleMsg5)
        })

      }
      .backgroundColor(Color.White)
      .width("100%")
      .height("100%")

  }
}