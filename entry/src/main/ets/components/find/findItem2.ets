@Component
export struct FindItem2{
  // 视屏号
  @Prop icon:Resource
  @Prop title:string
  @Prop headIcon?:Resource
  @Prop desc?:string
  @Prop isRedPoint?:boolean

  build() {
    Column(){
      Row(){
        // 最左侧图标和标题
        Row(){
          Image(this.icon)
            .width(28)
            .height(28)
            .margin({right:12})
          Text(this.title)
        }
        .margin({
          top:8,
          left:30
        })

        // 是否有红点
        Row(){
          if(this.isRedPoint){
            Badge({
              value:'',
              position:BadgePosition.RightTop,
              style:{badgeSize:6,badgeColor:Color.Red}
            }){
              Image(this.headIcon)
                .borderRadius(10)
                .width(28)
                .height(28)
                .margin({ right:12 })
            }
          }else{
            Image(this.headIcon)
              .borderRadius(10)
              .width(28)
              .height(28)
              .margin({ right:12 })
          }
          Text(this.desc)
            .lineHeight(28)
            .margin({ right:12 })

          // 向右箭头
          Image($r('app.media.right_arrow'))
            .width(18)
            .height(18)
        }
        .margin({
          right:28
        })

      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width("100%")
      .height(48)

    }
    .width("100%")
    .height("100%")

  }

}