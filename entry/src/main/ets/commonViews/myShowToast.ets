import promptAction from '@ohos.promptAction'

/*提示消息，持续时间两秒*/
export function myShowToast(content:string){
  promptAction.showToast({
    message:content,
    duration:2000,
    alignment:Alignment.Center
  })
}