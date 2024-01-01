{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "87b50f22",
   "metadata": {},
   "outputs": [],
   "source": [
    "from selenium import webdriver\n",
    "from selenium.webdriver.common.by import By\n",
    "from selenium.webdriver.support.ui import WebDriverWait\n",
    "from selenium.webdriver.support import expected_conditions as EC\n",
    "import threading"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "2381dfcb",
   "metadata": {},
   "outputs": [],
   "source": [
    "import asyncio\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c9294bc4",
   "metadata": {
    "scrolled": true
   },
   "outputs": [],
   "source": [
    "\n",
    "# 启动浏览器驱动程序\n",
    "driver = webdriver.Chrome()\n",
    "\n",
    "# 打开网页\n",
    "driver.get(\"http://\")\n",
    "\n",
    "# 等待h1标签出现\n",
    "h1_tag = WebDriverWait(driver, 10)\n",
    "        .until(EC.presence_of_element_located((By.TAG_NAME, \"h1\")))\n",
    "\n",
    "# 获取h1标签的文本内容\n",
    "h1_value = h1_tag.text\n",
    "\n",
    "# 检测h1标签的文本内容是否为\"waste\"\n",
    "search = 'waste'\n",
    "if h1_value.find(search) != -1:\n",
    "    print(\"H1标签的内容值为'waste'\")\n",
    "else:\n",
    "    print(\"H1标签的内容值不是'waste'\")\n",
    "\n",
    "# 关闭浏览器驱动程序\n",
    "driver.quit()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "d4d242c1",
   "metadata": {},
   "outputs": [],
   "source": [
    "# 启动浏览器驱动程序\n",
    "def dr(i):\n",
    "    driver = webdriver.Chrome()\n",
    "\n",
    "    createurl = 'http://'\n",
    "\n",
    "    # 打开网页\n",
    "    driver.get(createurl)\n",
    "\n",
    "    # 等待h1标签出现\n",
    "    html = WebDriverWait(driver, 10) \\\n",
    "    .until(EC.presence_of_element_located((By.TAG_NAME, \"html\")))\n",
    "\n",
    "    suf = str(i)\n",
    "    driver.find_element(By.NAME, 'user').send_keys('user' + suf)\n",
    "\n",
    "    driver.find_element(By.NAME, 'username').send_keys('username' + suf)\n",
    "\n",
    "    driver.find_element(By.NAME, 'type').send_keys('tests')\n",
    "\n",
    "    driver.find_element(By.CSS_SELECTOR, 'input[type=submit]').click()\n",
    "\n",
    "    driver.quit()\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "8779b19e",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4d865fc2",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "dd9c69a9",
   "metadata": {},
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "023a223e",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "None\n",
      "None\n",
      "None\n",
      "None\n",
      "None\n"
     ]
    }
   ],
   "source": [
    "tasks = [threading.Thread(target=dr, args=(i,)) for i in range(110, 115)]\n",
    "\n",
    "for t in tasks:\n",
    "    print(t.start())\n",
    "\n",
    "for i in tasks:\n",
    "    i.join()\n",
    "\n",
    "# loop = asyncio.get_running_loop()\n",
    "\n",
    "# at1 = asyncio.gather(*tasks)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "2da4c313",
   "metadata": {},
   "outputs": [],
   "source": [
    "await dr(111)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "9ed98c8b",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.10.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
