package classes.partb;

class SuperClass {
    int x;

    SuperClass() {
        x = 3;
        System.out.println("in SuperClass:x=" + x);
    }

    void doSomething() {
        System.out.println("in SuperClass.doSomething()");
    }
}

class SubClass extends SuperClass {
    int x;

    SubClass() {
        super();//调用父类的构造方法，其实不写也将会对父类构造
        x = 5;//super()要放在方法中的第一句
        System.out.println("in SubClass:x=" + x);
    }

    void doSomething() {
        super.doSomething();//调用父类的方法
        System.out.println("in SubClass.doSomething()");
        System.out.println("super.x= " + super.x + " sub.x= " + x);
    }
}

public class Inheritance {
    public static void main(String[] args) {
        SubClass subC = new SubClass();
        subC.doSomething();
    }
}
