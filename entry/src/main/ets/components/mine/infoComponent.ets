interface infoInterface{
  icon:Resource
  title:string
}

@Component
export struct InfoComponent{
  @Prop icon:Resource
  @Prop title:string
  @Prop isLatest:boolean=false

  build() {
   Column(){
     Row() {
       // 图片
       Column() {
         Image(this.icon)
           .width(28)
           .height(28)
           .borderRadius(5)
       }
       .layoutWeight(1)

       // 文字
       Column() {
         Text(this.title)
           .margin({ right: 130 })
           .textAlign(TextAlign.Center)
           .height(28)
           .width("100%")
       }
       .layoutWeight(3)
       .width("100%")

       // 箭头
       Column() {
         Image($r('app.media.right_arrow'))
           .width(24)
           .height(24)
       }
       .layoutWeight(1)
     }
     .height(56)

     // 是否在底边画线
     if(!this.isLatest){
       Divider().strokeWidth(0.5).color("#DDDDDD")
     }

   }
   .height("100%")
   .width("100%")

  }
}