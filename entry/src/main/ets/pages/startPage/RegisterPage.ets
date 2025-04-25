import { router } from '@kit.ArkUI'
import { comInput } from '../../commonViews/comInput'
import { myShowToast } from '../../commonViews/myShowToast'
import { register, User } from '../../model/userModel'

/*注册页面*/
@Entry
@Component

export struct RegisterPage{
  @State @Watch('onInputChange') inputnickname:string=''  // Watch侦听器：侦听器件的变化
  @State @Watch('onInputChange') inputpassword:string=''
  @State @Watch('onInputChange') repeatinputpassword:string=''
  @State btnisdisable:boolean=true

  // 改变按钮可点击性
  onInputChange(){
    this.btnisdisable=!(this.inputnickname&&this.inputpassword&&this.repeatinputpassword)
  }

  // 校验密码的一致性
  checkPassWord():boolean{
    if(this.inputpassword != this.repeatinputpassword){
      this.btnisdisable=true
      return false
    }
    return true
  }

  build() {
    Flex({
      direction:FlexDirection.Column
    }){
      Column() {
        Image($r('app.media.left_arrow'))
          .width(36)
          .height(36)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/startPage/LoginPage'
            })
          })
      }
      .justifyContent(FlexAlign.Start)

      // 头像选择
      Column(){
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Image($r('app.media.camera'))
            .width(56)
            .height(56)
        }
        .width(120)
        .height(120)
        .backgroundColor("#CCCCCC")
        .margin({ top: 40 })

        /**
         * 在这里添加打开文件并选择头像的代码
         * */
        // getImageFilesInFolder().then((this.avatarSource) => {});

      }
      .width('100%')

      // 账号密码
      Column({space:80}){
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
          comInput({
            title:'确认密码',
            placeholder:'请确认密码',
            type:InputType.Password,
            value:$repeatinputpassword
          })
        }

        // 注册按钮
        if(this.btnisdisable) { // 不可被点击
          Button("注册并登录")
            .width(200)
            .height(50)
            .fontSize(20)
            .backgroundColor(Color.Gray)
        }else{                  // 可以被点击
          Button("注册并登录")
            .width(200)
            .height(50)
            .fontSize(20)
            .backgroundColor(Color.Blue)
            .onClick(() => {
              /*这里可以写点击后的跳转逻辑*/
              if(this.checkPassWord()){
                let user: User = {              // 注册
                  username : this.inputnickname,
                  password : this.inputpassword
                }
                register(user)
                myShowToast("注册成功")
                router.pushUrl({
                  url:'pages/mainPages/Main'
                })
              }else{
                myShowToast("密码不一致")
              }
              
            })
        }

      }.justifyContent(FlexAlign.Center)
      .flexGrow(1)
    }
    .height('100%')
    .width('100%')
  }
}