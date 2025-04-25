import { resourceManager } from "@kit.LocalizationKit"

@Component
export struct GroupChatComponent{
  @Prop iconList:Resource[]
  @Prop title:string
  @Prop subTitle:string

  build() {
    Column(){
      Row(){
        // 头像
        Column(){
          Grid(){ // 网格布局
            ForEach(this.iconList,(item:Resource)=>{
              GridItem(){
                Image(item)
              }
            },(item:Resource)=>(item.id.toString()))
          }
          .width(48)
          .height(48)
          .margin({
            left:8,
            right:12
          })
          .align(Alignment.Start)
          .rowsTemplate('1fr 1fr 1fr')
          .columnsTemplate('1fr 1fr 1fr')
        }
        // 文字
        Column(){
          Column(){
            Text(this.title)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
          }
          .height(28)
          Column(){
            Text(this.subTitle)
          }
          .height(28)
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width("100%")
      .height(48)
    }
    .width("100%")
    .height("100%")
  }
}