import { MsgInterface } from '../model/message'
import { comInput } from './comInput'
import { router } from '@kit.ArkUI'
import { Params } from '../model/params'
import { PersonInterface } from '../model/person'
import { myShowToast } from './myShowToast'

/*聊天界面*/
// 没有群聊功能
@Entry
@Component
export struct chatPage{
  @State inputText:string=''

  params = router.getParams() as Params
  friend = this.params.friend as PersonInterface
  me = this.params.me as PersonInterface
  msg = this.params.msg as MsgInterface[]

  build() {
    Column() {
      // 显示好友头像、昵称
      Row() {
        // 返回箭头
        Row(){
          Image($r('app.media.left_arrow'))
            .width(48)
            .height(48)
        }
        .onClick(()=>router.back())
        // 好友头像
        Row({ space: 0 }) {
          Image(this.friend.icon)
            .width(48)
            .height(48)
            .borderRadius(10)
            .margin({ left: 12 })
          // 好友昵称
          Text(this.friend.name)
            .fontSize(24)
            .fontColor(Color.Black)
            .margin({ left: 12 })
        }
        .alignItems(VerticalAlign.Top)
        .layoutWeight(1)

        Row() {
        }
      }
      .backgroundColor("#EDEDED")

      // 显示聊天内容
      Scroll() {
        Column() {
          ForEach(this.msg, (item: MsgInterface, key) => {
            if (item.name === this.me.name) { // 判断消息是不是自己发送的
              Row() {
                Row(){}.layoutWeight(1)

                Row() {
                  // 自己发送的消息
                  Text(item.message)
                    .fontSize(24)
                    .fontColor(Color.White)
                    .margin({ right: 24 })
                    .padding({
                      left: 12,
                      right: 12,
                      top: 8,
                      bottom: 8
                    })
                    .backgroundColor("#0099FF")
                    .borderRadius(10)
                }

                Row() {
                  // 自己头像
                  Image(this.me.icon)
                    .width(24)
                    .height(24)
                    .borderRadius(12)
                    .margin({ right: 24 })
                }
              }
              .margin({ bottom:12 })

            } else {
              Row() {
                Row() {
                  // 好友头像
                  Image(this.friend.icon)
                    .width(24)
                    .height(24)
                    .borderRadius(12)
                    .margin({ left: 24 })
                }

                Row() {
                  // 好友消息
                  Text(item.message)
                    .fontSize(24)
                    .fontColor(Color.Black)
                    .margin({ left: 24 })
                    .padding({
                      left: 12,
                      right: 12,
                      top: 8,
                      bottom: 8
                    })
                    .backgroundColor("#F2F2F2")
                    .borderRadius(10)
                }
                Row(){}.layoutWeight(1)

              }
              .margin({ bottom:12 })
            }

          }, (item: MsgInterface) => item.name)
        }

      }
      .layoutWeight(2)

      Row(){}.layoutWeight(2)

      // 消息输入框
      Row() {
        comInput({
          title: '',
          placeholder: "输入消息",
          type: InputType.Normal,
          value: $inputText
        })
          .layoutWeight(1)

        // 发送按钮
        Button('发送')
          .width(80)
          .height(36)
          .borderRadius(18)
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .onClick(() => {
            if (this.inputText != '') {
              // 更新msg数组
              const newMsg: MsgInterface = {
                name: this.me.name,
                message: this.inputText
              }
              // 更新msg数组
              this.msg.push(newMsg)
              // 清空输入
              this.inputText = ''
            }
          })
      }
      .backgroundColor(Color.White)
      .padding({
        left: 8,
        right: 8,
        top: 8,
        bottom: 8
      })
    }
    .height("100%")
    .width("100%")
  }
}