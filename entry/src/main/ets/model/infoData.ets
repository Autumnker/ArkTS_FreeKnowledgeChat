export interface InfoInterface{
  icon:Resource,
  title:string
}

export const InfoList: InfoInterface[] = [
  {
    icon:$r('app.media.shou_cang'),
    title:'收藏'
  },
  {
    icon:$r('app.media.pyq'),
    title:'朋友圈'
  },
  {
    icon:$r('app.media.video'),
    title:'视频号'
  },
  {
    icon:$r('app.media.ka_bao'),
    title:'卡包'
  },
  {
    icon:$r('app.media.biao_qing'),
    title:'表情'
  }
]