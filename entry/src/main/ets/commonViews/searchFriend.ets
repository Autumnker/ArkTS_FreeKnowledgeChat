import router from '@ohos.router';
import prompt from '@ohos.prompt';

@Entry
@Component
export struct searchFriend {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        // 返回按钮（左箭头图标）
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Image($r('app.media.left_arrow')) // 返回图标
            .width(36) // 图标大小
            .height(36)
            .margin({ right: 8 }) // 图标与文字间距
            .backgroundColor("#4990FF")
            .onClick(()=>{router.back()})
        }
        .onClick(() => {
          router.back(); // 返回上一页
        })
        .padding(8) // 按钮内边距，增加点击区域
        .backgroundColor(Color.Transparent) // 按钮背景透明

        Text('添加好友')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 8 }) // 文字与图标的间距

        Flex().flexGrow(1) // 占位
      }
      .width('100%')
      .height(56)
      .padding({ left: 8, right: 16 }) // 导航栏整体内边距
      .backgroundColor('#4A90E2')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      // 内容区域
      Scroll() {
        Column() {
          // 搜索框
          Row() {
            Image($r('app.media.search')) // 搜索图标
              .width(24)
              .height(24)
              .margin({ right: 12 })

            TextInput({ placeholder: '输入 ID/手机号/邮箱' })
              .fontSize(16)
              .flexGrow(1)
          }
          .width('100%')
          .height(48)
          .padding({ left: 16, right: 16 })
          .backgroundColor(Color.White)
          .borderRadius(10)
          .margin({ top: 5, bottom: 10 }) // 调整搜索栏的 margin，上移

          // 功能入口
          Grid() {
            GridItem() {
              Column() {
                Image($r('app.media.chatAvatar3')) // 手机联系人图标
                  .width(48)
                  .height(48)
                  .backgroundColor('#4A90E21A')
                  .borderRadius(24)

                Text('手机联系人')
                  .fontSize(16)
                  .margin({ top: 8 })
              }
              .onClick(() => {
                router.push({
                  url: 'pages/PhoneContactsPage' // 确保路径正确
                });
              })
            }

            GridItem() {
              Column() {
                Image($r('app.media.add_friend')) // 面对面添加图标
                  .width(48)
                  .height(48)
                  .backgroundColor('#4A90E21A')
                  .borderRadius(24)

                Text('面对面添加')
                  .fontSize(16)
                  .margin({ top: 8 })
              }
              .onClick(() => {
                router.push({
                  url: 'pages/FaceToFacePage' // 确保路径正确
                });
              })
            }
          }
          .columnsTemplate('1fr 1fr')
          .rowsGap(20)
          .columnsGap(20)
          .margin({ bottom: 20 })

          // 可能认识的人
          Column() {
            Text('可能认识的人')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 16 })

            // 用户列表
            List() {
              ListItem() {
                Row() {
                  Image($r('app.media.chatAvatar3')) // 用户头像
                    .width(48)
                    .height(48)
                    .borderRadius(24)

                  Column() {
                    Text('阿Q')
                      .fontSize(16)
                      .fontWeight(FontWeight.Medium)

                    Text('来自通讯录')
                      .fontSize(14)
                      .fontColor('#666666')
                  }
                  .margin({ left: 12 })

                  Button({ type: ButtonType.Normal, stateEffect: true }) {
                    Text('添加')
                      .fontSize(14)
                  }
                  .width(80)
                  .height(32)
                  .backgroundColor('#4A90E2')
                  .borderRadius(6)
                  .onClick(() => {
                    prompt.showToast({
                      message: '已发送好友请求',
                      duration: 2000
                    });
                  })
                }
                .width('100%')
                .padding({ top: 12, bottom: 12 })
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(VerticalAlign.Center)
              }

              ListItem() {
                Row() {
                  Image($r('app.media.chatAvatar4')) // 用户头像
                    .width(48)
                    .height(48)
                    .borderRadius(24)

                  Column() {
                    Text('爱狗人士')
                      .fontSize(16)
                      .fontWeight(FontWeight.Medium)

                    Text('可能认识的朋友')
                      .fontSize(14)
                      .fontColor('#666666')
                  }
                  .margin({ left: 12 })

                  Button({ type: ButtonType.Normal, stateEffect: true }) {
                    Text('添加')
                      .fontSize(14)
                  }
                  .width(80)
                  .height(32)
                  .backgroundColor('#4A90E2')
                  .borderRadius(6)
                  .onClick(() => {
                    prompt.showToast({
                      message: '已发送好友请求',
                      duration: 2000
                    });
                  })
                }
                .width('100%')
                .padding({ top: 12, bottom: 12 })
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(VerticalAlign.Center)
              }
            }
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
          .backgroundColor(Color.White)
          .borderRadius(10)
          .margin({ bottom: 20 })

          // 其他功能
          Column() {
            Row() {
              Image($r('app.media.group_chat')) // 群聊找人图标
                .width(24)
                .height(24)
                .margin({ right: 12 })

              Text('群聊找人')
                .fontSize(16)
                .flexGrow(1)

              Image($r('app.media.right_arrow')) // 右箭头图标
                .width(24)
                .height(24)
            }
            .width('100%')
            .padding({ top: 12, bottom: 12 })
            .onClick(() => {
              router.push({
                url: 'pages/GroupSearchPage' // 跳转到群聊找人页面
              });
            })

            Row() {
              Image($r('app.media.search')) // 附近的人图标
                .width(24)
                .height(24)
                .margin({ right: 12 })

              Text('附近的人')
                .fontSize(16)
                .flexGrow(1)

              Image($r('app.media.find_origin')) // 右箭头图标
                .width(24)
                .height(24)
            }
            .width('100%')
            .padding({ top: 12, bottom: 12 })
            .onClick(() => {
              router.push({
                url: 'pages/NearbyPage' // 跳转到附近的人页面
              });
            })

            Row() {
              Image($r('app.media.search')) // 账号找人图标
                .width(24)
                .height(24)
                .margin({ right: 12 })

              Text('账号找人')
                .fontSize(16)
                .flexGrow(1)

              Image($r('app.media.right_arrow')) // 右箭头图标
                .width(24)
                .height(24)
            }
            .width('100%')
            .padding({ top: 12, bottom: 12 })
            .onClick(() => {
              router.push({
                url: 'pages/AccountSearchPage' // 跳转到账号找人页面
              });
            })
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
          .backgroundColor(Color.White)
          .borderRadius(10)
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 0 }) // 调整 Column 的 padding，整体上移
      }
      .flexGrow(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F2F5')
  }
}