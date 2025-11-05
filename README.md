# 国有企业公文模板项目

## 项目概述

为国有企业提供一套贴近内部文档规范的 LaTeX 模板。

## 模板状态

- [x] 公司规章制度模板：用于创建公司内部的规章制度文档。
- [x] 通用公文模板：用于创建通用的正式公文，如事件报告、发文稿、联系单等。

## 使用方法

### 公司规章制度模板

将 `规章制度/company-rule.cls` 文件复制到你的LaTeX项目目录，然后在你的 `.tex` 文件中使用：

```latex
\documentclass{company-rule}

% 可选配置
% \documentclass[small]{company-rule}         % 小字体（小三号15pt）
% \documentclass[large]{company-rule}         % 大字体（三号16pt）
% \documentclass[nobracket]{company-rule}     % 条款标题不加括号
% \documentclass[small,nobracket]{company-rule} % 组合选项

\begin{document}

% 使用 article 环境创建条款
\article{总则}
第一条 本制度适用于公司全体员工。

\article{附则}
第二十条 本制度自发布之日起施行。

\end{document}
```

### 通用公文模板

将 `通用公文/common-doc.cls` 文件复制到你的LaTeX项目目录，然后在你的 `.tex` 文件中使用：

```latex
\documentclass{common-doc}

\begin{document}

% 使用 section 命令创建标题
\section{一、工作概述}
这里是工作概述内容。

% 使用行内标题（不编号）
\section*{重要说明}
这里是重要说明内容。

% 使用附件环境
\begin{attachments}
\item 附件一：相关表格
\item 附件二：参考资料
\end{attachments}

\end{document}
```

## 许可证

本项目采用 MIT 许可证，详见 [LICENSE](LICENSE) 文件。

## 致谢

感谢各国有企业用户在模板开发过程中提供的宝贵建议和支持。
