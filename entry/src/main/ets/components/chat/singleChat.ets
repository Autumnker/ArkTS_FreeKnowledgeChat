@Component
export struct SingleChatComponent{
  @Prop icon:Resource
  @Prop title:string
  @Prop subTitle:string

  build() {
    Column(){
      Row(){
        // 头像
        Column(){
          Image(this.icon)
            .borderRadius(4)
            .width(48)
            .height(48)
        }
        .margin({
          left:8,
          right:12
        })
        // 文字
        Column() {
          // 昵称
          Column() {
            Text(this.title).fontSize(16).fontWeight(FontWeight.Bold)
              .height(28)
          }
          // 消息缩略
          Column(){
            Text(this.subTitle)
          }
          .height(28)
        }
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Start)
      }
      .justifyContent(FlexAlign.Start)
      .width("100%")
      .height(48)
    }
    .width("100%")
    .height("100%")
  }
}