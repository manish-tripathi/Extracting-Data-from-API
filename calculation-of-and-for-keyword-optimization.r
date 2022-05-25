{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "2379b464",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "papermill": {
     "duration": 0.004085,
     "end_time": "2022-05-25T07:27:26.627847",
     "exception": false,
     "start_time": "2022-05-25T07:27:26.623762",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Input the files\n",
    "a) \"clicksdata.kw8322228.csv\"\n",
    "b) \"clicksdata.kw8322392.csv\"\n",
    "c) \"clicksdata.kw8322393.csv\"\n",
    "d) \"clicksdata.kw8322445.csv\"\n",
    "\n",
    "in Homework_3.R\n",
    "\n",
    "I have used the .R file for calculation of alpha and beta \n",
    "\n",
    "The remaining optimization for both unconstrained and constrained budget has been done in \"hw-kw-ltv-conv.rate-data-Solution.xlsx\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "aab0039e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:26.638033Z",
     "iopub.status.busy": "2022-05-25T07:27:26.635933Z",
     "iopub.status.idle": "2022-05-25T07:27:26.936192Z",
     "shell.execute_reply": "2022-05-25T07:27:26.934269Z"
    },
    "papermill": {
     "duration": 0.308115,
     "end_time": "2022-05-25T07:27:26.939117",
     "exception": false,
     "start_time": "2022-05-25T07:27:26.631002",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Importing required Libraries\n",
    "library(readr) \n",
    "library(readxl)\n",
    "options(digits = 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "5be4530b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:26.979582Z",
     "iopub.status.busy": "2022-05-25T07:27:26.946147Z",
     "iopub.status.idle": "2022-05-25T07:27:27.034530Z",
     "shell.execute_reply": "2022-05-25T07:27:27.031814Z"
    },
    "papermill": {
     "duration": 0.095223,
     "end_time": "2022-05-25T07:27:27.037266",
     "exception": false,
     "start_time": "2022-05-25T07:27:26.942043",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Importing Datasets\n",
    "\n",
    "clicksdata_kw8322228 <- read.csv(\"../input/marketing-analytics-homework/clicksdata.kw8322228.csv\")\n",
    "\n",
    "clicksdata_kw8322392 <- read.csv(\"../input/marketing-analytics-homework/clicksdata.kw8322392.csv\")\n",
    "\n",
    "clicksdata_kw8322393 <- read.csv(\"../input/marketing-analytics-homework/clicksdata.kw8322393.csv\")\n",
    "\n",
    "clicksdata_kw8322445 <- read.csv(\"../input/marketing-analytics-homework/clicksdata.kw8322445.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "49c32741",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:27.046659Z",
     "iopub.status.busy": "2022-05-25T07:27:27.044763Z",
     "iopub.status.idle": "2022-05-25T07:27:27.090531Z",
     "shell.execute_reply": "2022-05-25T07:27:27.088683Z"
    },
    "papermill": {
     "duration": 0.053274,
     "end_time": "2022-05-25T07:27:27.093375",
     "exception": false,
     "start_time": "2022-05-25T07:27:27.040101",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>alpha</dt><dd>74.0911379674713</dd><dt>beta</dt><dd>0.0394487704398785</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[alpha] 74.0911379674713\n",
       "\\item[beta] 0.0394487704398785\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "alpha\n",
       ":   74.0911379674713beta\n",
       ":   0.0394487704398785\n",
       "\n"
      ],
      "text/plain": [
       "         alpha           beta \n",
       "74.09113796747  0.03944877044 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "229.814750867467"
      ],
      "text/latex": [
       "229.814750867467"
      ],
      "text/markdown": [
       "229.814750867467"
      ],
      "text/plain": [
       "[1] 229.8147509"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nls_output_kw8322228 <- nls(n.clicks ~ alpha*(1-exp(-beta*bid.value)), \n",
    "                            start = list(alpha=150, beta= 0.5),\n",
    "                            data=clicksdata_kw8322228)\n",
    "\n",
    "coef_kw8322228 <- coef(nls_output_kw8322228) #alpha and beta\n",
    "coef_kw8322228\n",
    "nls_output_kw8322228$m$deviance() #residual-sum-of-squares"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "6ad84107",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:27.103018Z",
     "iopub.status.busy": "2022-05-25T07:27:27.101429Z",
     "iopub.status.idle": "2022-05-25T07:27:27.129939Z",
     "shell.execute_reply": "2022-05-25T07:27:27.128094Z"
    },
    "papermill": {
     "duration": 0.03581,
     "end_time": "2022-05-25T07:27:27.132505",
     "exception": false,
     "start_time": "2022-05-25T07:27:27.096695",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>alpha</dt><dd>156.440010486422</dd><dt>beta</dt><dd>0.150082491721708</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[alpha] 156.440010486422\n",
       "\\item[beta] 0.150082491721708\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "alpha\n",
       ":   156.440010486422beta\n",
       ":   0.150082491721708\n",
       "\n"
      ],
      "text/plain": [
       "         alpha           beta \n",
       "156.4400104864   0.1500824917 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nls_output_kw8322392 <- nls(n.clicks ~ alpha*(1-exp(-beta*bid.value)), \n",
    "                            start = list(alpha=150, beta= 0.5),\n",
    "                            data=clicksdata_kw8322392)\n",
    "\n",
    "coef_kw8322392 <- coef(nls_output_kw8322392) #alpha and beta\n",
    "coef_kw8322392"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "31b6af44",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:27.142828Z",
     "iopub.status.busy": "2022-05-25T07:27:27.140974Z",
     "iopub.status.idle": "2022-05-25T07:27:27.173051Z",
     "shell.execute_reply": "2022-05-25T07:27:27.170094Z"
    },
    "papermill": {
     "duration": 0.040677,
     "end_time": "2022-05-25T07:27:27.176539",
     "exception": false,
     "start_time": "2022-05-25T07:27:27.135862",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>alpha</dt><dd>104.799292835134</dd><dt>beta</dt><dd>0.079716594168143</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[alpha] 104.799292835134\n",
       "\\item[beta] 0.079716594168143\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "alpha\n",
       ":   104.799292835134beta\n",
       ":   0.079716594168143\n",
       "\n"
      ],
      "text/plain": [
       "          alpha            beta \n",
       "104.79929283513   0.07971659417 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nls_output_kw8322393 <- nls(n.clicks ~ alpha*(1-exp(-beta*bid.value)), \n",
    "                            start = list(alpha=max(clicksdata_kw8322393$n.clicks),\n",
    "                                         beta= 1/mean(clicksdata_kw8322393$bid.value)),\n",
    "                            data=clicksdata_kw8322393)\n",
    "\n",
    "coef_kw8322393 <- coef(nls_output_kw8322393) #alpha and beta\n",
    "coef_kw8322393"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "4ab36222",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:27.188481Z",
     "iopub.status.busy": "2022-05-25T07:27:27.186009Z",
     "iopub.status.idle": "2022-05-25T07:27:27.266932Z",
     "shell.execute_reply": "2022-05-25T07:27:27.264703Z"
    },
    "papermill": {
     "duration": 0.089351,
     "end_time": "2022-05-25T07:27:27.269483",
     "exception": false,
     "start_time": "2022-05-25T07:27:27.180132",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>alpha</dt><dd>188.111955544323</dd><dt>beta</dt><dd>0.432289135120423</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[alpha] 188.111955544323\n",
       "\\item[beta] 0.432289135120423\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "alpha\n",
       ":   188.111955544323beta\n",
       ":   0.432289135120423\n",
       "\n"
      ],
      "text/plain": [
       "         alpha           beta \n",
       "188.1119555443   0.4322891351 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nls_output_kw8322445 <- nls(n.clicks ~ alpha*(1-exp(-beta*bid.value)), \n",
    "                            start = list(alpha=150, beta= 0.5),\n",
    "                            data=clicksdata_kw8322445)\n",
    "\n",
    "coef_kw8322445 <- coef(nls_output_kw8322445) #alpha and beta\n",
    "coef_kw8322445"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "55b1b352",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-05-25T07:27:27.282032Z",
     "iopub.status.busy": "2022-05-25T07:27:27.280133Z",
     "iopub.status.idle": "2022-05-25T07:27:27.329386Z",
     "shell.execute_reply": "2022-05-25T07:27:27.326494Z"
    },
    "papermill": {
     "duration": 0.059022,
     "end_time": "2022-05-25T07:27:27.332594",
     "exception": false,
     "start_time": "2022-05-25T07:27:27.273572",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "                 alpha          beta\n",
      "kw8322228  74.09113797 0.03944877044\n",
      "kw8322392 156.44001049 0.15008249172\n",
      "kw8322393 104.79929284 0.07971659417\n",
      "kw8322445 188.11195554 0.43228913512\n"
     ]
    }
   ],
   "source": [
    "df = data.frame()\n",
    "df[1, \"alpha\"] = coef_kw8322228[1]\n",
    "df[2, \"alpha\"] = coef_kw8322392[1]\n",
    "df[3, \"alpha\"] = coef_kw8322393[1]\n",
    "df[4, \"alpha\"] = coef_kw8322445[1]\n",
    "\n",
    "\n",
    "## --------------------------------------------------------------------------------------------\n",
    "df[1, \"beta\"] = coef_kw8322228[2]\n",
    "df[2, \"beta\"] = coef_kw8322392[2]\n",
    "df[3, \"beta\"] = coef_kw8322393[2]\n",
    "df[4, \"beta\"] = coef_kw8322445[2]\n",
    "\n",
    "rownames(df) <- c(\"kw8322228\", \"kw8322392\", \"kw8322393\", \"kw8322445\")\n",
    "\n",
    "\n",
    "## --------------------------------------------------------------------------------------------\n",
    "print(df)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 4.57812,
   "end_time": "2022-05-25T07:27:27.467566",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-05-25T07:27:22.889446",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
