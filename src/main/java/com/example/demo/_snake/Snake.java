package com.example.demo._snake;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

/**
 * <p>
 * TODO
 * </P>
 *
 * @author hyosunghan
 * @since 2021-02-22
 */

public class Snake {
    private int x;
    private int y;
    private int length;
    private int pace;
    private int nextx;
    private int nexty;
    private int tailx;
    private int taily;
    //Distance from the target
    private int dFromT;
    private int len;
    private int width;
    private String direction;
    private ArrayList<Node> snake = new ArrayList<Node>();


    public int getDFromT() {
        return dFromT;
    }

    public void setDFromT(int distance) {
        this.dFromT = distance;
    }

    {
        dFromT = 0;
        nextx = -1;
        nexty = -1;

    }

    public int getTailx() {
        return tailx;
    }

    public void setTailx(int tailx) {
        this.tailx = tailx;
    }

    public int getTaily() {
        return taily;
    }

    public void setTaily(int taily) {
        this.taily = taily;
    }

    public int getNextx() {
        return nextx;
    }

    public void setNextx(int nextx) {
        this.nextx = nextx;
    }

    public int getNexty() {
        return nexty;
    }

    public void setNexty(int nexty) {
        this.nexty = nexty;
    }

    public int getPace() {
        return pace;
    }

    public void setPace(int pace) {
        this.pace = pace;
    }

    public int getLength() {
        return length;
    }

    private class Node {
        private int x;
        private int y;

        public Node(int x, int y) {
            super();
            length++;
            this.x = x;
            this.y = y;
        }

        public int getX() {
            return x;
        }

        public void setX(int x) {
            this.x = x;
        }

        public int getY() {
            return y;
        }

        public void setY(int y) {
            this.y = y;
        }

    }

    public boolean eat(Food fd) {
        if (fd.getX() == this.x && fd.getY() == this.y) {
            System.out.println("吃东西啦！好开心~");
            snake.add(new Node(tailx, taily));
            return true;
        }
        return false;
    }

    public int show(int i, int j) {
        int num = 0;
        for (Node node : snake) {
            if (node.getX() == i && node.getY() == j) {
                // System.out.println("冲突检测");
                return num;
            }
            num++;
        }
        return -1;
    }
    public boolean run(Food fd){
        if(fd.getX()>this.x){
            this.nextx+=this.pace;
            this.nexty = this.y;
        }else if(fd.getX()<this.x){
            this.nextx-=this.pace;
            this.nexty = this.y;
        }else if(fd.getY()>this.y){
            this.nextx = this.x;
            this.nexty+=this.pace;
        }else if(fd.getY()<this.y){
            this.nextx = this.x;
            this.nexty-=this.pace;
        }else{
            return false;
        }
        return true;
    }

    public boolean hangOut(int ax,int ay) {
        System.out.println("进入闲逛模式，参数是需要远离的点，如果没有办法选择安全路径就会切换到不安全的随机模式");

        int[][] map;
        map = new int[this.len][this.width];
        int aimx = ax;
        int aimy = ay;
        //标记食物不可以吃，吃食物必须在外面
        for (Node node : snake) {
            if (node.getX() >= 0 && node.getY() >= 0) {
                map[node.getX()][node.getY()] = 1;
            }
        }

        int findx = this.x;
        int findy = this.y;
        boolean reflag = false;
        int biggerManha = 0;
        int ManhattanDistance = 0;
        int defaultx = -1;
        int defaulty = -1;
        int space = -1;
        int willGo = findx + this.pace;
        int biggerStep = -1;
        if (willGo < len && map[willGo][findy] != 1) {

            // 如果这一步在棋盘范围内，而且不会撞上蛇身
            // 计算它和食物的哈曼吨距离
            ManhattanDistance = Math.abs(aimx - (willGo)) + Math.abs(aimy - findy);
            System.out.println("右移 最大距离：" + biggerManha + " 本次距离：" + ManhattanDistance);

            // 如果longdistance记录的哈曼吨距离小于这个点的
            if (biggerManha <= ManhattanDistance || defaultx == -1) {
                // 记录下这个点的曼哈顿距离还有坐标，这一点就是远离食物的点，我们还要检测它是不是能找到尾巴

                if (findShortestRoad(willGo, findy, tailx, taily)) {
                    if (biggerStep < this.dFromT) {
                        biggerStep = this.dFromT;

                        biggerManha = ManhattanDistance;
                        if (dFromT > space) {
                            defaultx = willGo;
                            defaulty = findy;
                            this.nextx = willGo;
                            this.nexty = findy;
                            reflag = true;
                        }
                    }else {
                        reflag = false;
                    }

                } else {
                    reflag = false;
                }
            }

        }
        willGo = findx - this.pace;
        if (willGo >= 0 && map[willGo][findy] != 1) {
            // 如果这一步在棋盘范围内，而且不会撞上蛇身
            // 计算它和食物的哈曼吨距离
            ManhattanDistance = Math.abs(aimx - (willGo)) + Math.abs(aimy - findy);
            System.out.println("左移  最大距离：" + biggerManha + " 本次距离：" + ManhattanDistance);
            // 如果longdistance记录的哈曼吨距离小于这个点的,或者默认值还没确定
            if (biggerManha <= ManhattanDistance || defaultx == -1) {
                // 记录下这个点的曼哈顿距离还有坐标，这一点就是远离食物的点，我们还要检测它是不是能找到尾巴

                if (findShortestRoad(willGo, findy, tailx, taily)) {
                    if (biggerStep < this.dFromT) {
                        biggerStep = this.dFromT;
                        biggerManha = ManhattanDistance;
                        // 计算能不能找到尾巴节点
                        // 只有离食物最远，而且安全的，才记录默认路径
                        // 必须先记录默认路径，它是一个判断要不要计算安全性的依据

                        if (dFromT > space) {// 如果找得到尾巴节点，就直接移动到这个节点
                            this.nextx = willGo;
                            this.nexty = findy;
                            defaultx = willGo;
                            defaulty = findy;
                            reflag = true;
                        }
                    }else {
                        reflag = false;
                    }
                } else {
                    reflag = false;
                }
            }

        }
        willGo = findy - this.pace;
        if (willGo >= 0 && map[findx][willGo] != 1) {
            // 如果这一步在棋盘范围内，而且不会撞上蛇身
            // 计算它和食物的哈曼吨距离
            ManhattanDistance = Math.abs(aimx - findx) + Math.abs(aimy - (willGo));
            System.out.println("上移  最大距离：" + biggerManha + " 本次距离：" + ManhattanDistance);

            // 如果longdistance记录的哈曼吨距离小于这个点的
            if (biggerManha <= ManhattanDistance || defaultx == -1) {
                // 记录下这个点的曼哈顿距离还有坐标，这一点就是远离食物的点，我们还要检测它是不是能找到尾巴

                if (findShortestRoad(findx, willGo, tailx, taily)) {
                    if (biggerStep < this.dFromT) {
                        biggerStep = this.dFromT;
                        biggerManha = ManhattanDistance;

                        if (dFromT > space) {
                            defaultx = findx;
                            defaulty = willGo;
                            this.nextx = findx;
                            this.nexty = willGo;
                            reflag = true;
                        }
                    }else {
                        reflag = false;
                    }
                } else {
                    reflag = false;
                }
            }

        }
        willGo = findy + this.pace;
        if (willGo < width && map[findx][willGo] != 1) {
            // 如果这一步在棋盘范围内，而且不会撞上蛇身
            // 计算它和食物的哈曼吨距离
            ManhattanDistance = Math.abs(aimx - findx) + Math.abs(aimy - willGo);
            System.out.println("下移   最大距离：" + biggerManha + " 本次距离：" + ManhattanDistance);

            // 如果longdistance记录的哈曼吨距离小于这个点的
            if (biggerManha <= ManhattanDistance || defaultx == -1) {
                // 记录下这个点的曼哈顿距离还有坐标，这一点就是远离食物的点，我们还要检测它是不是能找到尾巴

                if (findShortestRoad(findx, willGo, tailx, taily)) {
                    if (biggerStep < this.dFromT) {
                        biggerStep = this.dFromT;
                        biggerManha = ManhattanDistance;

                        if (dFromT > space) {
                            this.nextx = findx;
                            this.nexty = willGo;
                            defaultx = findx;
                            defaulty = willGo;
                            reflag = true;
                        }
                    }else {
                        reflag = false;
                    }
                } else {
                    reflag = false;
                }
            }

        }

        System.out.println("默认：" + defaultx + "," + defaulty);
        System.out.println("最大的曼哈顿数:" + biggerManha + " flag " + reflag);
        System.out.println("最长距离：" + biggerStep + " 预测 x y " + nextx + "  " + nexty);
        if (!reflag) {

            if (defaultx != -1 && defaulty != -1) {
                this.nextx = defaultx;
                this.nexty = defaulty;
                System.out.println("用了默认：" + defaultx + "," + defaulty);
                reflag = true;

            }

            else {
                reflag =true;
                System.out.println("最坏的情况，分析：");
                if (findx - this.pace >= 0 && map[findx - this.pace][findy]
                        != 1) { this.nextx = findx - this.pace; this.nexty = findy;
                    return reflag; } if (findy - this.pace >= 0 && map[findx
                        ][findy- this.pace] != 1) { this.nextx = findx ; this.nexty =
                        findy- this.pace; return reflag; } if (findx + this.pace <len
                        && map[findx + this.pace][findy] != 1) { this.nextx = findx +
                        this.pace; this.nexty = findy; return reflag; } if (findy +
                        this.pace <width && map[findx ][findy+ this.pace] != 1) {
                    this.nextx = findx ; this.nexty = findy+ this.pace; return
                            reflag; 	}reflag =false;
                //	 reflag =true;
					/*  System.out.println("开心就好~下面再走可能碰壁");
					  Scanner sc = new Scanner(System.in);
					  sc.nextLine();*/
            }

        }

        return reflag;
    }

    public boolean findShortestRoad(int fromx, int fromy, int aimx, int aimy) {
        System.out.println("你的所在位置：（"+fromx+","+fromy+"） 探索目标：（"+aimx+","+aimy+"）");
        int[][] map;
        map = new int[this.len][this.width];
        this.dFromT = -1;
        nextx = -1;
        nexty = -1;
        if (fromx < 0 || fromx > this.len - 1 || fromy < 0 || fromy > this.width - 1) {

            return false;
        }
        for (Node node : snake) {
            if (node.getX() >= 0 && node.getY() >= 0) {
                map[node.getX()][node.getY()] = 1;// 令蛇身不可达
            }
        }
        map[aimx][aimy] = 0;// 令食物和尾巴可达

        LinkedHashMap<Road, Integer> openList = new LinkedHashMap<Road, Integer>();
        // ArrayList<Road> closeList = new ArrayList<Road>();
        int findx = fromx;
        int findy = fromy;
        Road snakeHead = new Road(findx, findy, null);
        Road son = null;
        Road father = null;
        boolean returnFlag = false;
        openList.put(snakeHead, 0);
        int DistanceHeadToFather = 0;
        int ManhattanDistance = 0;
        int weight = 0;
        Integer lastWeight = 0;
        int minWeight = Integer.MAX_VALUE;// 最小权重等于最大的数，一定没有比它大的

        while (!openList.isEmpty()) {
            Play.looop++;// 记录循环次数

            Set<Map.Entry<Road, Integer>> entrySet = openList.entrySet();
            DistanceHeadToFather += this.pace;
            // System.out.print("集合元素：");
            father = null;
            minWeight = Integer.MAX_VALUE;
            for (Map.Entry<Road, Integer> entry : entrySet) {
                // System.out.print(" " +entry.getValue());
                father = minWeight > entry.getValue() ? entry.getKey() : father;// 如果最小权重发生变化，father记录的值也变化
                minWeight = minWeight > entry.getValue() ? entry.getValue() : minWeight;// 只有更小权重出现，才发生变化
            }
            // System.out.println();
            // System.out.println("获取的父元素："+father+"minwei "+minWeight);
            findx = father.getX();// 这时候将父元素的值取出来，父元素里面记录着最小权重的路径坐标
            findy = father.getY();
            openList.remove(father);// 在map里面移除已经取出的父元素
            map[findx][findy] = 1;// 并且把父元素标记为已经走过的状态

            if (findx == aimx && findy == aimy) {
                // 找到了
                returnFlag = true;
                break;
            }
            // System.out.println(findx+","+findy+" ----- "+aimx+","+aimy);
            if (findx - this.pace >= 0 && map[findx - this.pace][findy] != 1) {
                ManhattanDistance = Math.abs(aimx - (findx - this.pace)) + Math.abs(aimy - findy);
                ManhattanDistance *= 1.11;
                weight = DistanceHeadToFather + this.pace + ManhattanDistance;
                son = new Road(findx - this.pace, findy, father);
                lastWeight = openList.get(son);
                // System.out.println("a:"+lastWeight);
                if (lastWeight != null) {
                    if (weight < lastWeight) {
                        openList.remove(son);
                        openList.put(son, weight);
                    }
                } else {
                    openList.put(son, weight);
                }
                // boy.add(new Road(findx - this.pace, findy, father));
            }
            if (findy - this.pace >= 0 && map[findx][findy - this.pace] != 1) {
                ManhattanDistance = Math.abs(aimx - findx) + Math.abs(aimy - (findy - this.pace));
                ManhattanDistance *= 1.11;
                weight = DistanceHeadToFather + this.pace + ManhattanDistance;
                son = new Road(findx, findy - this.pace, father);
                lastWeight = openList.get(son);
                // System.out.println("b:"+lastWeight);
                if (lastWeight != null) {
                    if (weight < lastWeight) {
                        openList.remove(son);
                        openList.put(son, weight);
                    }
                } else {
                    openList.put(son, weight);
                }
                // boy.add(new Road(findx, findy - this.pace, father));
            }
            if (findx + this.pace < len && map[findx + this.pace][findy] != 1) {
                ManhattanDistance = Math.abs(aimx - (findx + this.pace)) + Math.abs(aimy - findy);
                ManhattanDistance *= 1.11;
                weight = DistanceHeadToFather + this.pace + ManhattanDistance;
                son = new Road(findx + this.pace, findy, father);
                lastWeight = openList.get(son);
                // System.out.println("c:"+lastWeight);
                if (lastWeight != null) {
                    if (weight < lastWeight) {
                        openList.remove(son);
                        openList.put(son, weight);
                    }
                } else {
                    openList.put(son, weight);
                }
                // boy.add(new Road(findx + this.pace, findy, father));
            }

            if (findy + this.pace < width && map[findx][findy + this.pace] != 1) {
                ManhattanDistance = Math.abs(aimx - findx) + Math.abs(aimy - (findy + this.pace));
                ManhattanDistance *= 1.11;
                weight = DistanceHeadToFather + this.pace + ManhattanDistance;
                son = new Road(findx, findy + this.pace, father);
                lastWeight = openList.get(son);
                // System.out.println("d:"+lastWeight);
                if (lastWeight != null) {
                    if (weight < lastWeight) {
                        openList.remove(son);
                        openList.put(son, weight);
                    }
                } else {
                    openList.put(son, weight);
                }
                // boy.add(new Road(findx, findy + this.pace, father));
            }

        }
        // System.out.println("head :"+this.x+" "+this.y);

        int getx = fromx, gety = fromy;
        if (returnFlag)
            while (father != null) {
                if (getx != father.getX() || gety != father.getY()) {
                    nextx = father.getX();
                    nexty = father.getY();
                    dFromT++;
                }
                System.out.println("start--end:"+father.getX() + "  " + father.getY() + "  ---> " + aimx + " : " + aimy);

                father = father.getFather();
            }
        System.out.println("到目标点的格子数:" + dFromT + " next :" + nextx + " " + nexty);

        return returnFlag;

    }

    public void moveNode(int nextHeadX, int nextHeadY) {

        this.x = nextHeadX;
        this.y = nextHeadY;
        int alterX = nextHeadX, alterY = nextHeadY;
        for (Node node : snake) {
            int tmpX = node.getX();
            int tmpY = node.getY();

            if (nextHeadX == tmpX && nextHeadY == tmpY) {
                System.out.println("游戏结束！你撞到自己了");
                System.out.println(tmpX + "," + tmpY + "---" + this.x + "," + this.y);
                Scanner sc = new Scanner(System.in);
                sc.nextLine();
                sc.close();
                System.exit(0);
            }
            node.setX(alterX);
            node.setY(alterY);
            alterX = tmpX;
            alterY = tmpY;
        }
        Node ha = snake.get(snake.size() - 1);
        this.tailx = ha.getX();
        this.taily = ha.getY();
        System.out.println("蛇长度：" + snake.size());

    }

    public void run(String wasd) {

        switch (wasd.toLowerCase()) {
            case "w":
                this.direction = wasd;
                this.y = this.y <= 0 ? this.width - this.pace : this.y - this.pace;
                break;
            case "s":
                this.direction = wasd;
                this.y = this.y >= this.width - this.pace ? 0 : this.y + this.pace;
                break;
            case "a":
                this.direction = wasd;
                this.x = this.x <= 0 ? this.len - this.pace : this.x - this.pace;
                break;
            case "d":
                this.direction = wasd;
                this.x = this.x >= this.len - this.pace ? 0 : this.x + this.pace;
                break;
            default:
                switch (this.direction) {
                    case "w":
                        this.y = this.y <= 0 ? this.width - this.pace : this.y - this.pace;
                        break;
                    case "s":
                        this.y = this.y >= this.width - this.pace ? 0 : this.y + this.pace;
                        break;
                    case "a":
                        this.x = this.x <= 0 ? this.len - this.pace : this.x - this.pace;
                        break;
                    case "d":
                        this.x = this.x >= this.len - this.pace ? 0 : this.x + this.pace;
                        break;
                    default:

                        break;
                }
                break;
        }
        // System.out.println(this.x+"y: "+this.y);

        moveNode(this.x, this.y);

    }

    public int getX() {
        return x;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public void setLength(int length) {
        this.len = length;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public Snake(int x, int y, int len, int width) {
        super();
        this.x = x;
        this.y = y;
        this.len = len;
        this.width = width;
        this.pace = x;
        this.tailx = x;
        this.taily = y;
        snake.add(new Node(x, y));
    }

    private static class Road {
        private int x;
        private int y;
        private Road father;

        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result + x;
            result = prime * result + y;
            return result;
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            Road other = (Road) obj;
            if (x != other.x) {
                return false;
            }
            if (y != other.y) {
                return false;
            }
            return true;
        }

        public int getX() {
            return x;
        }


        public void setX(int x) {
            this.x = x;
        }

        public int getY() {
            return y;
        }

        public void setY(int y) {
            this.y = y;
        }

        public void setFather(Road father) {
            this.father = father;
        }

        public Road() {
            super();
            // TODO Auto-generated constructor stub
        }

        public Road(int x, int y, Road father) {
            super();
            this.x = x;
            this.y = y;
            this.father = father;
        }

        public Road getFather() {
            return father;
        }
    }

}

