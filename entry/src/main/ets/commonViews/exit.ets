import { router } from '@kit.ArkUI'

/*跳转按钮*/
// 点击右侧箭头返回登录页面
@Entry
@Component
export struct exit{
  @Prop indexPage:string="pages/Index"

  build() {
    Column(){
      Row({space:0}) {
        Row() {
          Image($r('app.media.left_arrow'))
            .width(36)
            .height(36)
            .margin({ left: 12 })
            .onClick(() => {
              router.back()
            })
        }
        .layoutWeight(1)
        Row(){}
      }
      .height("5%")
      .width("100%")

      Row() {
        Row(){}.layoutWeight(1)
        Row() {
          Text("退出")
            .fontSize(36)
            .fontColor(Color.White)
        }
        Row(){}.layoutWeight(1)
      }
      .backgroundColor(Color.Black)
      .height("8%")
      .width("98%")
      .borderRadius(15)
      .onClick(()=> {
        router.pushUrl({
          url: this.indexPage
        })})
    }
    .width("100%")
    .height("100%")

  }
}