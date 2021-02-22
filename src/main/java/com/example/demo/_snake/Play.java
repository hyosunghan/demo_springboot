package com.example.demo._snake;

import java.awt.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;
import java.util.Scanner;

/**
 * <p>
 * TODO
 * </P>
 *
 * @author hyosunghan
 * @since 2021-02-22
 */
public class Play extends Frame {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private static int length;
    private static int width;
    private static int pace;
    public static int looop;
    private long usedTime;
    private int step;
    private int wait;
    private boolean gameOver;
    {
        wait = 100;
        usedTime = 0;
        step = 1;
        gameOver = false;
    }
    static {

        length = 500;
        width = 500;
        pace = 10;
        looop = 0;
    }
    private Snake snake;
    private Food food;

    @Override
    public void paint(Graphics g) {
        g.setColor(Color.black);
        g.drawRect(10, 40, length, width);
        g.setColor(Color.GREEN);
        g.fillOval(food.getX() + 10, food.getY() + 40, pace, pace);
        g.setColor(Color.LIGHT_GRAY);
        int tmp = -1;
        for (int i = 0; i < length; i += pace) {
            for (int j = 0; j < width; j += pace) {
                if ((tmp = snake.show(i, j)) != -1 && tmp != 0 && tmp != snake.getLength() - 1) {
                    g.fillRect(i + 10, j + 40, pace, pace);
                }

            }
        }
        //g.setColor(Color.PINK);
        g.fillRect(snake.getTailx() + 10, snake.getTaily() + 40, pace, pace);
        g.setColor(Color.CYAN);
        g.fillRect(snake.getX() + 10, snake.getY() + 40, pace, pace);
    }

    public static void show1(Snake sn, Food fd) {

        int nodeNumber = 0;
        for (int i = 0; i < width; i++) {
            System.out.print("-");
        }
        // System.out.println();
        for (int i = 0; i < length; i++) {
            for (int j = 0; j < width; j++) {
                if (i == fd.getX() && j == fd.getY()) {
                    System.out.print("*");
                } else if ((nodeNumber = sn.show(i, j)) != -1) {
                    if (nodeNumber == 0) {
                        System.out.print("%");
                    } else {
                        System.out.print("@");
                    }
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println("|");
        }
        for (int i = 0; i < width; i++) {
            System.out.print("-");
        }
        System.out.println();
    }

    public long getUsedTime() {
        return usedTime;
    }

    public void setUsedTime(long usedTime) {
        this.usedTime = usedTime;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public static void main(String[] args) {
        playOne();
//        	playTwo();
    }
    //重新写策略，暂时完成度不高，坑多了，准备重新写但是时间不够，留坑在此
    private static void playTwo() {
        // TODO Auto-generated method stub
        Play pl = new Play();
        // 画图进程开启
        EventQueue.invokeLater(new Runnable() {

                                    @Override
                                   public void run() {

                                       pl.setSize(length + 80, width + 50);
                                       pl.setLocation(300, 100);
                                       pl.setVisible(true);
                                   }
                               }

        );
        Scanner sc = new Scanner(System.in);
        // 初始化蛇的位置，还有告诉蛇，我们场地的长宽
        Snake snake = new Snake(pace, pace, length, width);
        // 初始化食物的位置
        Food fd = new Food(length, width, pace);
        fd.setX();
        fd.setY();
        // 记录一下蛇的信息，实现类内部数据共享
        pl.snake = snake;
        // 记录食物的位置，实现类内部数据共享
        pl.food = fd;
        //实现游戏随时暂停功能，按g会暂停
        String wait = "g";
        // 游戏没有结束就继续
        while (!pl.gameOver) {
            try {
                if (System.in.available() > 0) {
                    wait = sc.nextLine();
                    wait = "g";
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            if (wait.equals("g")) {
                wait = sc.nextLine();
            }
            // 当前能不能找到食物？
            System.out.println("蛇头部搜索食物");
//			if (snake.findShortestRoad(snake.getX(), snake.getY(), fd.getX(), fd.getY())) {
            if (snake.run(fd)) {
                int hTof = snake.getDFromT();
                // 找得到食物，还要预判吃东西的路安不安全
                // foodnx,foodny代表算法生成的 蛇的下一步坐标
                int foodnx = snake.getNextx();
                int foodny = snake.getNexty();
                // 判断下一步路是不是安全路径，通过找尾巴来判断
                System.out.println("从预测的下一步搜索尾巴(此时的倒数第二节坐标才是尾巴)，验证下一步是否安全");

                if (snake.findShortestRoad(foodnx, foodny, snake.getTailx(), snake.getTaily())) {


                    System.out.println("探明尾巴距离食物的格子数");
                    snake.findShortestRoad(snake.getTailx(), snake.getTaily(), fd.getX(), fd.getY());
                    int tTof = snake.getDFromT();
                    // 当前位置与食物距离是hTOf， 尾巴在食物的距离是tTof
                    System.out.println("头部到食物：" + hTof + "  尾巴到食物：" + tTof);
                    // 如果蛇下一步就可以吃到食物，尾巴就在食物附近，那么可能会撞到尾巴
                    if (snake.getLength() < 5 || hTof != 0 || tTof != 0) {
                        System.out.println("吃东西的下一步,即找的到尾巴，，，也找得到食物,就是安全路径");
                        snake.moveNode(foodnx, foodny);
                    } else {
                        System.out.println("蛇头部和尾巴在食物附近，这时候可能会被堵死，去一条远离食物的路线");
//							sc.nextLine();
                        // 控制蛇向远离食物的地方前进，可以最大可能的寻找新的机会吃食物
                        if (snake.hangOut(fd.getX(), fd.getY())) {
                            snake.moveNode(snake.getNextx(), snake.getNexty());
                        } else {
                            System.out.println("贪吃蛇遇到了麻烦！无路可走");
                            sc.nextLine();

                        }

                    }

                } else {
                    // 如果在下一步不能连通蛇尾巴，这条路就是不安全的，让它选一个远离蛇尾巴的地方前进
                    if (snake.hangOut(snake.getTailx(), snake.getTaily())) {
                        snake.moveNode(snake.getNextx(), snake.getNexty());
                    } else {
                        System.out.println("闲逛也无路可走，需要分析");
                        sc.nextLine();
                    }
                }
            } else {
                // 当前不能找到食物的位置，就说明食物可能在尾巴另外一边，我们去一个远离尾巴的位置就好了，能够最大限度地寻求机会吃食物
                System.out.println("闲逛,目标是尾巴");
                if (snake.hangOut(snake.getTailx(), snake.getTaily())) {
                    snake.moveNode(snake.getNextx(), snake.getNexty());
                } else {
                    System.out.println("贪吃蛇遇到了麻烦！无路可走");
                    sc.nextLine();
                }
            }

            pl.repaint();

            System.out.println("循环" + looop + " 第" + pl.getStep() + "步");
            System.out.println("\n\n");
            // snake.run(wasd);
            if (snake.eat(fd)) {

                pl.setStep(pl.getStep() + 1);
                fd.setX();
                fd.setY();
                int fx = fd.getX();
                int fy = fd.getY();
                if (snake.show(fx, fy) != -1) {

                    HashMap<Integer, int[]> map = new HashMap<Integer, int[]>();

                    int key = 0;
                    for (fx = 0; fx < length; fx += pace) {
                        for (fy = 0; fy < width; fy += pace) {
                            if (snake.show(fx, fy) == -1) {

                                map.put(key++, new int[] { fx, fy });
                            }
                        }
                    }
                    if (!map.isEmpty()) {
                        Random random = new Random();
                        int[] xy = map.get(random.nextInt(map.size()));
                        fd.setX(xy[0]);
                        fd.setY(xy[1]);
                    } else {
                        System.out.println("你赢了！");
                        pl.gameOver = true;

                    }
                    // if(snake.getLength()>20)
                    // sc.nextLine();
                }

            }
            long st = System.currentTimeMillis();
            // show1(snake, fd);
            long end = System.currentTimeMillis();

            while (end - st < pl.wait) {
                end = System.currentTimeMillis();
            }
            pl.usedTime += pl.wait;

        }

    }

    private static void playOne() {
        try {

            Play pl = new Play();

            // 画图进程开启
            EventQueue.invokeLater(new Runnable() {

                                       @Override
                                       public void run() {

                                           pl.setSize(length + 20, width + 50);
                                           pl.setLocation(100, 100);
                                           pl.setVisible(true);
                                       }
                                   }

            );

            Snake snake = new Snake(pace, pace, length, width);
            pl.snake = snake;
            snake.setPace(pace);
            Food fd = new Food(length, width, pace);
            pl.food = fd;
            Scanner sc = new Scanner(System.in);
            String wasd = "w";
            pl.setStep(5);

            // sc.nextLine();
            while (!wasd.equals("e")) {

                /*
                 * if (System.in.available() > 0) { sc.nextLine(); }
                 */

                // snake.run(fd);
                /*
                 * if (snake.findShortestRoad(snake.getX(),snake.getY(),snake.
                 * getTailx(), snake.getTaily())) {
                 * snake.moveNode(snake.getNextx(), snake.getNexty()); }
                 */

                System.out.println("食物位置：" + fd.getX() + "  " + fd.getY());
                System.out.println("蛇的位置：" + snake.getX() + "  " + snake.getY());
                System.out.println("找尾巴：" + snake.getTailx() + " , " + snake.getTaily());

                int distance = 0;
                System.out.print("探测蛇尾，路径安全检测： ");
                if (snake.findShortestRoad(snake.getX(), snake.getY(), snake.getTailx(), snake.getTaily())) {
                    distance = snake.getDFromT();
                }
                if (snake.getLength() < length / pace * width / pace * 0.1) {
                    System.out.println("如果长度不够，达不到蛇尾，，就自动吃东西");

                    if (snake.findShortestRoad(snake.getX(), snake.getY(), fd.getX(), fd.getY())) {
                        snake.moveNode(snake.getNextx(), snake.getNexty());
                    }
                } else if (distance > 0) {
                    System.out.print("能达到蛇尾，探测食物： ");

                    if (snake.findShortestRoad(snake.getX(), snake.getY(), fd.getX(), fd.getY())) {
                        // 也找到得到吃的，还要预判吃东西的路安不安全
                        int foodnx = snake.getNextx();
                        int foodny = snake.getNexty();
                        System.out.print("去食物的下一步，能找到尾巴吗");
                        if (snake.findShortestRoad(foodnx, foodny, snake.getTailx(), snake.getTaily())) {
                            int tailnnx = snake.getNextx();
                            int tailnny = snake.getNexty();
                            int safeD = snake.getDFromT();
                            System.out.print("去食物的下一步，能找到食物");
                            // 如果吃东西的下一步会找 到尾巴，就说明蛇不会被锁死，但是可能会陷入死循环，需要加条件判断。
                            snake.findShortestRoad(foodnx, foodny, fd.getX(), fd.getY());

                            int go = 0;// 判断食物和尾巴是不是在不同方向，如果在不同方向，就说明不能同时达到。
                            if (tailnnx == foodnx && foodnx == snake.getNextx()) {
                                go = (tailnny - foodny) * (snake.getNexty() - foodny);
                            } else if (tailnny == foodny && foodny == snake.getNexty()) {
                                go = (tailnnx - foodnx) * (snake.getNextx() - foodnx);

                            }
			/*				if (snake.getLength() > 20 && safeD < 2 && snake.getDFromT() < 1) {
								System.out.println("分析追尾情况 go " + go + " distance" + safeD + " , " + snake.getDFromT());
								sc.nextLine();
							}*/
                            if ((length * width - snake.getLength()) < 4) {
                                System.out.println("这条件加什么！！");
                                sc.nextLine();
                            }
                            // safeD表示下一步到尾巴的距离，如果下一步到食物和到尾巴距离分别等于1和0，go表示尾巴食物在不在下一步的两边，不能两全，必绕圈。
                            if (go >= 0 && (safeD > 1 || snake.getDFromT() > 0)
                                    || (length * width - snake.getLength()) < 4) {
                                System.out.println("下一步尾巴食物在同侧，到尾巴安全距离>1，下一步不是食物");
                                System.out.println("吃东西的下一步,即找的到尾巴，，，也找得到食物,就是安全路径");
                                snake.moveNode(foodnx, foodny);
                            } else {
                                System.out.println("吃的下一步，尾巴，食物不在一边，闲逛目标食物  " + go);
                                // sc.nextLine();snake.getTailx(),
                                // snake.getTaily()
                                if (snake.hangOut(fd.getX(), fd.getY())) {
                                    snake.moveNode(snake.getNextx(), snake.getNexty());
                                } else {

                                    System.out.println("贪吃蛇遇到了麻烦！无路可走");
                                    sc.nextLine();
                                }
                            }

                        } else {
                            // 去吃东西会陷入困境，就去
                            System.out.println("去吃东西会陷入困境，就逛逛，目标尾巴");
                            // if (distance == 1)
                            // sc.nextLine();
                            {
                                // if
                                // (snake.hangOut(fd.getX(),fd.getY()))snake.getTailx(),
                                // snake.getTaily()
                                if (snake.hangOut(snake.getTailx(), snake.getTaily())) {
                                    snake.moveNode(snake.getNextx(), snake.getNexty());
                                } else {

                                    System.out.println("闲逛也无路可走，需要分析");
                                    sc.nextLine();
                                }
                            } /*
                             * else snake.moveNode(nx, ny);
                             */
                        }
                    } else {
                        // 能到达蛇尾，就是找不到吃的，就找尾巴
                        System.out.println("能到达蛇尾，就是找不到吃的，就找尾巴");

                        {
                            // 追着尾巴可能会陷入转圈，
                            System.out.println("可能会转圈，看看能不能解决");

                            // sc.nextLine();
                            System.out.println("闲逛,目标是尾巴");
                            if (snake.hangOut(snake.getTailx(), snake.getTaily())) {
                                snake.moveNode(snake.getNextx(), snake.getNexty());
                            } else {

                                System.out.println("贪吃蛇遇到了麻烦！无路可走");
                                sc.nextLine();
                            }

                        }
                    }

                } else if (distance == 0) {
                    System.out.println("如果达不到蛇尾 ，就去离尾巴最远的地方");
                    // sc.nextLine();snake.getTailx(), snake.getTaily()
                    if (snake.hangOut(snake.getTailx(), snake.getTaily())) {
                        snake.moveNode(snake.getNextx(), snake.getNexty());
                    } else {

                        System.out.println("贪吃蛇遇到了麻烦！无路可走");
                        sc.nextLine();
                    }
                }

                pl.repaint();
                System.out.println("循环" + looop + " 第" + pl.getStep() + "步");
                System.out.println("\n\n");
                // snake.run(wasd);
                if (snake.eat(fd)) {
                    pl.setStep(pl.getStep() + 1);
                    fd.setX();
                    fd.setY();
                    int fx = fd.getX();
                    int fy = fd.getY();
                    if (snake.show(fx, fy) != -1) {

                        HashMap<Integer, int[]> map = new HashMap<Integer, int[]>();

                        int key = 0;
                        for (fx = 0; fx < length; fx += pace) {
                            for (fy = 0; fy < width; fy += pace) {
                                if (snake.show(fx, fy) == -1) {

                                    map.put(key++, new int[] { fx, fy });
                                }
                            }
                        }
                        if (!map.isEmpty()) {
                            Random random = new Random();
                            int[] xy = map.get(random.nextInt(map.size()));
                            fd.setX(xy[0]);
                            fd.setY(xy[1]);
                        } else {
                            System.out.println("你赢了！");
                            break;
                        }
                    }

                }
                long st = System.currentTimeMillis();
                // show1(snake, fd);
                long end = System.currentTimeMillis();

                while (end - st < pl.wait) {
                    end = System.currentTimeMillis();
                }
                pl.usedTime += pl.wait;
            }
            sc.close();
        } finally {
        }
    }
}
