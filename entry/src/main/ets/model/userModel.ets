// model/userModel.ets
export interface User {
  username: string;
  password: string;
}

// 模拟用户数据库
const users: User[] = [];

// 注册函数
export function register(user: User): boolean {
  const existingUser = users.find(u => u.username === user.username);
  if (existingUser) {
    return false; // 用户已存在
  }
  users.push(user);
  return true;
}

// 登录函数
export function login(username: string, password: string): boolean {
  const user = users.find(u => u.username === username && u.password === password);
  return user !== undefined;
}