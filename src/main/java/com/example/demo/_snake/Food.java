package com.example.demo._snake;

import java.util.Random;

/**
 * <p>
 * TODO
 * </P>
 *
 * @author hyosunghan
 * @since 2021-02-22
 */
public class Food {
    private int x;
    private int y;
    private int length ;
    private int width ;
    private int pace;

    public Food(int length, int width,int pace) {
        super();
        random = new Random();
        this.length = length;
        this.width = width;
        this.pace = pace;

    }
    private Random random;

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(int y) {
        this.y = y;
    }

    public void setY() {
        this.y = random.nextInt(width/pace)*pace;
    }
    public void setX() {
        this.x = random.nextInt( length/pace)*pace;
    }
	/*public void setY(int sss) {
		this.y = yyy[sss-1];
	}
	public void setX(int sss) {
		this.x = xxx[sss-1];
	}*/

}
