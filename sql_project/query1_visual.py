import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("result_1_top_paying_jobs.csv")

# --- Top Skills by Demand ---
plt.figure(figsize=(10,6))
top_demand = df.sort_values("skill_count", ascending=False).head(15)
plt.bar(top_demand["skills"], top_demand["skill_count"], color="skyblue")
plt.title("Top Skills by Demand")
plt.ylabel("Job Postings")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig("top_skills_demand.png")

# --- Top Skills by Salary ---
plt.figure(figsize=(10,6))
top_salary = df.sort_values("avg_salary", ascending=False).head(15)
plt.bar(top_salary["skills"], top_salary["avg_salary"], color="orange")
plt.title("Top Skills by Salary")
plt.ylabel("Average Salary")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig("top_skills_salary.png")

# --- Scatter Plot ---
plt.figure(figsize=(10,6))
plt.scatter(df["skill_count"], df["avg_salary"], s=100, alpha=0.6, color="green")
for i, txt in enumerate(df["skills"]):
    plt.annotate(txt, (df["skill_count"][i], df["avg_salary"][i]),
                 textcoords="offset points", xytext=(5,5), fontsize=8)
plt.title("Demand vs Salary")
plt.xlabel("Skill Demand")
plt.ylabel("Average Salary")
plt.tight_layout()
plt.savefig("demand_vs_salary.png")
