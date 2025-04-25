/*谁发的什么消息*/
// 缺少时间参数，时间参数可用于排列以确定上下文位置关系
export interface MsgInterface{
  name:string,
  message:string
}

export let exampleMsg0:MsgInterface[]=[]

export let exampleMsg1:MsgInterface[] = [
  {
    name:'admin',
    message:'你好'
  },
  {
    name:'船长',
    message:'你好  1'
  },
  {
    name:'admin',
    message:'你好  2'
  },
  {
    name:'船长',
    message:'你好  3'
  },
  {
    name:'admin',
    message:'你好  4'
  }
]

export let exampleMsg2:MsgInterface[] = [
  {
    name:'admin',
    message:'你好'
  },
  {
    name:'乐神',
    message:'回家吃饭了'
  },
  {
    name:'admin',
    message:'马上回来'
  },
  {
    name:'乐神',
    message:'(*^_^*)'
  },
  {
    name:'admin',
    message:'(●ˇ∀ˇ●)'
  }
]

export let exampleMsg3:MsgInterface[] = [
  {
    name:'admin',
    message:'你好'
  },
  {
    name:'火车头',
    message:'来针5号化合物？'
  },
  {
    name:'admin',
    message:'不用'
  },
  {
    name:'火车头',
    message:'行'
  },
  {
    name:'admin',
    message:'抱拳'
  }
]

export let exampleMsg4:MsgInterface[] = [
  {
    name:'admin',
    message:'你好'
  },
  {
    name:'爱狗人士',
    message:'你最喜欢雪纳瑞哪一点？'
  },
  {
    name:'admin',
    message:'它们的肉……很好吃'
  },
  {
    name:'爱狗人士',
    message:'啪，打了一巴掌'
  },
  {
    name:'admin',
    message:'┭┮﹏┭┮'
  }
]

export let exampleMsg5:MsgInterface[] = [
  {
    name:'admin',
    message:'你好'
  },
  {
    name:'Autumnker',
    message:'计算机真有趣'
  },
  {
    name:'admin',
    message:'头发掉光了'
  },
  {
    name:'Autumnker',
    message:'打游戏打得'
  },
  {
    name:'admin',
    message:'(ˉ▽ˉ；)...'
  }
]