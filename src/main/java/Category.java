import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Category {
  private String name;
  // private static List<Category> instances = new ArrayList<Category>();
  private int id;
  // private List<Task> mTasks;

  public Category(String name) {
    this.name = name;
    // instances.add(this);
    // mId = instances.size();
    // mTasks = new ArrayList<Task>();
  }

  public String getName() {
    return name;
  }

  public static List<Category> all() {
    // return instances;
    String sql = "SELECT id, name FROM categories";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Category.class);
    }
  }

  // public static void clear() {
  //   instances.clear();
  // }

  public int getId() {
    return id;
  }

  // public static Category find(int id) {
  //   return instances.get(id - 1);
  // }

  public List<Task> getTasks() {
    // return mTasks;
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM tasks where categoryId=:id";
      return con.createQuery(sql)
        .addParameter("id", this.id)
        .executeAndFetch(Task.class);
    }
  }

  // public void addTask(Task task) {
  //   mTasks.add(task);
  // }

  public static Category find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM categories where id=:id";
      Category category = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Category.class);
      return category;
    }
    // try {
    //   return instances.get(id-1);
    // }catch (IndexOutOfBoundsException exception){
    //   return null;
    // }
  }

  @Override
  public boolean equals(Object otherCategory) {
    if(!(otherCategory instanceof Category)) {
      return false;
    } else {
      Category newCategory = (Category) otherCategory;
      return this.getName().equals(newCategory.getName()) &&
             this.getId() == newCategory.getId();
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO categories (name) VALUES (:name)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .executeUpdate()
        .getKey();
    }
  }

}
