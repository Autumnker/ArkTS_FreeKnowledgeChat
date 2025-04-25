@Component
export struct SearchComponent{

  build(){
    Column(){
      Row(){
        Image($r('app.media.search'))
          .width(18)
          .height(18)
          .margin({left:-20})

        Row(){
          Text('搜索')
        }
        .margin({left:16})
      }
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)
      .backgroundColor('#EDEDFF')
      .height(36)
      .width("98%")
    }
    .alignItems(HorizontalAlign.Center)
  }
}