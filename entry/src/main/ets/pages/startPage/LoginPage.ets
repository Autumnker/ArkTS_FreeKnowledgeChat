import { router } from '@kit.ArkUI'
import { comInput } from '../../commonViews/comInput'
import { login } from '../../model/userModel'
import { myShowToast } from '../../commonViews/myShowToast'

/*登录页面*/
@Entry
@Component

export struct LoginPage{
  @State @Watch('onInputChange') inputnickname:string=''
  @State @Watch('onInputChange') inputpassword:string=''
  @State btnisdisable:boolean=true



  onInputChange(){  //  当两输入框和密码不为空时，登录按钮才可以被点击
    this.btnisdisable=!(this.inputnickname&&this.inputpassword)
  }

  build() {
    Flex({
      direction:FlexDirection.Column
    }){
      Column() {
        Image($r('app.media.logo'))
          .width('100')
          .height('100')

        Text(' ') // 使用空文本作为间距
          .width(20) // 设置间距宽度

        Image($r('app.media.title'))
          .width('210')
          .height('140')
      }
      .width('100%')

      Column({space:80}){

        // 账号密码输入框
        Column(){
          comInput({
            title:'昵称',
            placeholder:'请输入昵称',
            type:InputType.Normal,
            value:$inputnickname
          })
          comInput({
            title:'密码',
            placeholder:'请输入密码',
            type:InputType.Password,
            value:$inputpassword
          })
        }
        Row() {
          // 登录按钮
          if (this.btnisdisable) { // 不可被点击
            Button("登录")
              .width(150)
              .height(50)
              .fontSize(20)
              .backgroundColor(Color.Gray)
              .margin({ right:15 })
          } else { // 可以被点击
            Button("登录")
              .width(150)
              .height(50)
              .fontSize(20)
              .backgroundColor(Color.Green)
              .margin({ right:15 })
              .onClick(() => {
                /*这里可以写点击后的跳转逻辑*/
                if(login(this.inputnickname, this.inputpassword) || this.inputnickname === "admin" && this.inputpassword === "123"){
                  myShowToast("登录成功")
                  router.pushUrl({
                    url:'pages/mainPages/Main'
                  })
                }else{
                  myShowToast("登录失败")
                }
              })
          }

          // 注册按钮
          Button("注册")
            .width(150)
            .height(50)
            .fontSize(20)
            .backgroundColor(Color.Blue)
            .margin({left:15})
            .onClick(() => {
              router.pushUrl({
                url:'pages/startPage/RegisterPage'
              })
            })

        }

      }.justifyContent(FlexAlign.Center)
      .flexGrow(1)

    }
    .height('100%')
    .width('100%')

  }
}