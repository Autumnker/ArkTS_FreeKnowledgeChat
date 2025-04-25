@Component
export struct Head{
  @Prop text:string
  @Prop icon:Resource

  build() {
    Row(){
      Row() {
        Text(this.text)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .width("100%")
      .justifyContent(FlexAlign.Center)
      .layoutWeight(1)
      Row(){
        Image(this.icon)
          .width(28)
          .height(28)
          .margin({right:20})
      }
    }
  }
}