import { router } from "@kit.ArkUI"
import { myShowToast } from "../../../commonViews/myShowToast"
import { PersonInterface } from "../../../model/person"

interface Moment{
  person:PersonInterface,
  picture:Resource,
  message:string
}

interface MomentList{
  date:string,
  moment:Moment
}

/*朋友圈页面*/
@Entry
@Component
export struct  moments{
  // @Prop me:PersonInterface
  // @Prop bgPicture:Resource
  scroller:Scroller = new Scroller()

  // 测试用例
  me:PersonInterface = {name:"花开富贵", icon:$r('app.media.chatAvatar5')}
  bgPicture:Resource = $r('app.media.theboys2')
  // 朋友圈消息测试用例
  momentList:MomentList[] = [
    {
      date: '2025/3/1',
      moment: {
        person: { icon: $r('app.media.pyq_headIcon'), name: '深海' },
        picture: $r('app.media.theboys6'),
        message: "瑞斯拜"
      }
    },
    {
      date: '2025/3/2',
      moment: {
        person: { icon: $r('app.media.theboys5'), name: '星光' },
        picture: $r('app.media.chatAvatar4'),
        message: "该喝热水了"
      }
    },
    {
      date: '2025/3/3',
      moment: {
        person: { icon: $r('app.media.theboys2'), name: '祖国人' },
        picture: $r('app.media.chatAvatar5'),
        message: "该买点奶粉了"
      }
    },
    {
      date: '2025/3/4',
      moment: {
        person: { icon: $r('app.media.theboys1'), name: '布彻尔' },
        picture: $r('app.media.chatAvatar6'),
        message: "可爱"
      }
    },
    {
      date: '2025/3/5',
      moment: {
        person: { icon: $r('app.media.theboys7'), name: '玄色' },
        picture: $r('app.media.chatAvatar7'),
        message: "卡哇伊(●'◡'●)"
      }
    }
  ]

  build() {
    // 上半部分
    Column(){
      Stack(){
        // 背景图片
        Image(this.bgPicture)
          .width("100%")
          .height("100%")
          .objectFit(ImageFit.Cover)

        Column() {
          Row() {
            // 返回箭头
            Row() {
              Image($r('app.media.left_arrow'))
                .width(48)
                .height(48)
            }
            .height(48)
            .width(48)
            .layoutWeight(1)
            .margin({ left: 8 })
            .onClick(() => {
              router.back()
            })

            // 相机
            Row() {
              Image($r('app.media.camera'))
                .width(48)
                .height(48)
            }
            .height(48)
            .width(48)
            .margin({ right: 8 })
            .onClick(() => {
              myShowToast("开发中……")
            })
          }
          .layoutWeight(1)
          .alignItems(VerticalAlign.Top)

          // 昵称、头像
          Row() {
            Row() {
            }
            .layoutWeight(1)

            // 昵称、头像
            Row() {
              Text(this.me.name)
                .fontSize(18)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
                .margin({ right: 12 })

              Image(this.me.icon)
                .width(78)
                .height(78)
                .borderRadius(12)
                .borderColor(Color.White)
                .margin({ right: 12 })
            }
          }
          .alignItems(VerticalAlign.Bottom)
        }
      }
      .width("100%")
      .height("40%")
      .backgroundColor(Color.Gray)
      .margin({ bottom:3 })

      // 朋友圈消息区域(下半部分)
      List({ scroller:this.scroller }) {
        // 朋友圈消息
        ForEach(this.momentList, (item: MomentList, key) => {
          ListItem() {
            Column() {
              Row() {
                Row() {
                  // 头像
                  Image(item.moment.person.icon)
                    .width(36)
                    .height(36)
                    .margin({ left: 8 })
                    .borderRadius(8)
                  // 昵称
                  Text(item.moment.person.name)
                    .fontSize(16)
                    .margin({ left: 8 })

                  // 发送时间
                  Text(item.date)
                    .fontSize(12)
                    .margin({ left: 12 })

                }.layoutWeight(1)
              }

              Column() {
                // 朋友圈消息
                Row() {
                  Text(item.moment.message)
                    .fontSize(16)
                }
                .margin({ left: 16 })
                .alignItems(VerticalAlign.Top)
                .justifyContent(FlexAlign.Start)

                // 图片
                Row() {
                  Image(item.moment.picture)
                    .width(180)
                    .height(120)
                }
                .margin({ left: 8 })
                .alignItems(VerticalAlign.Bottom)
                .justifyContent(FlexAlign.Start)
              }
              .margin({ top: 4 })

            }
            .margin({ bottom: 10 })
          }

        }, (item: MomentList) => item.date)

      }
      .width("100%")
      .height("60%")
      .backgroundColor("#EDEDED")

    }
    .width("100%")
    .height("100%")

  }
}