@Component
export struct AddressBookItem{
  @Prop icon:Resource
  @Prop title:string
  @Prop bgColor:string = '#FA9E3B'

  build() {

    Column(){
      Row(){
        Stack(){
          Row(){}
          .width(24)
          .height(24)
          .backgroundColor(this.bgColor)
          Image(this.icon)
            .height(16)
            .width(16)
        }
        Text(this.title)
          .margin({ left:12 })
      }
      .width("95%")
      .justifyContent(FlexAlign.Start)
    }
    .height("100%")
    .width("100%")

  }
}