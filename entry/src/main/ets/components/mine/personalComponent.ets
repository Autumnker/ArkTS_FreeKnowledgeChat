@Component
export struct PersonalComponent{
  @Prop icon:Resource = $r('app.media.chatAvatar5')
  @Prop name:string = "花开富贵"
  @Prop username:string = "cdut_ed"

  build() {
    Row(){
      Column(){
        Image(this.icon)
          .width(96)
          .height(96)
          .borderRadius(10)
          .margin({ left:16 })
      }.layoutWeight(1)

      Column(){
        // 个人信息
        Row(){
          Text(this.name).fontSize(22).fontWeight(FontWeight.Bold)
        }
        .width("100%")
        Row(){
          Text('微信号: ' + this.username)
          Image($r('app.media.er_wei_ma'))
            .width(18)
            .height(18)
            .margin({ left:24 })
          Image($r('app.media.right_arrow'))
            .width(36)
            .height(36)
            .margin({ left:24 })
        }
        .width("100%")
        .margin({ top:4 })

        // 个人状态
        Row(){
          Text('+ 状态')
            .border({
              width:1,
              color:"#DDDDDD",
              radius:10
            })

          Stack({alignContent:Alignment.BottomStart}) {
            // 状态1
            Image($r('app.media.nija1'))
              .width(14)
              .height(14)
              .borderRadius(10)
              .margin({left:12})
            // 状态2
            Image($r('app.media.nija2'))
              .width(14)
              .height(14)
              .borderRadius(10)
              .margin({left:24})
            // 状态3
            Image($r('app.media.nija3'))
              .width(14)
              .height(14)
              .borderRadius(10)
              .margin({left:36})
          }
          Text("等18个朋友").fontSize(12)
            .margin({ left:8 })
        }
        .margin({ top:12 })
      }
      .margin({ left:20 })
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(3)
    }
    .width("100%")
    .height("100%")
  }
}