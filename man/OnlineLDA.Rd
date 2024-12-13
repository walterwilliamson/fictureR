% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OnlineLDA.R
\name{OnlineLDA}
\alias{OnlineLDA}
\title{OnlineLDA Class}
\description{
Online Latent Dirichlet Allocation (LDA) for topic modeling.
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{vocab}}{A vector of terms in the vocabulary.}

\item{\code{K}}{The number of topics.}

\item{\code{M}}{The length of the vocabulary.}

\item{\code{N}}{The total token count across all documents.}

\item{\code{tau0}}{Delay parameter for learning rate.}

\item{\code{kappa}}{Learning rate exponent.}

\item{\code{zeta}}{Regularization parameter.}

\item{\code{updatect}}{The update count for the model.}

\item{\code{max_iter_inner}}{Maximum number of iterations for the inner optimization loop.}

\item{\code{max_iter_gamma}}{Maximum number of iterations for gamma optimization.}

\item{\code{tol}}{Convergence tolerance for the optimization.}

\item{\code{verbose}}{Verbosity level (0 for silent, 1 for basic output, etc.).}

\item{\code{Elog_beta}}{Expectation of log beta, the topic-word distribution.}

\item{\code{lambda}}{The global lambda parameters.}

\item{\code{alpha}}{Initial document-topic distribution prior.}

\item{\code{eta}}{Initial topic-word distribution prior.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-OnlineLDA-new}{\code{OnlineLDA$new()}}
\item \href{#method-OnlineLDA-init_global_parameter}{\code{OnlineLDA$init_global_parameter()}}
\item \href{#method-OnlineLDA-do_e_step}{\code{OnlineLDA$do_e_step()}}
\item \href{#method-OnlineLDA-update_lambda}{\code{OnlineLDA$update_lambda()}}
\item \href{#method-OnlineLDA-approx_score}{\code{OnlineLDA$approx_score()}}
\item \href{#method-OnlineLDA-clone}{\code{OnlineLDA$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-OnlineLDA-new"></a>}}
\if{latex}{\out{\hypertarget{method-OnlineLDA-new}{}}}
\subsection{Method \code{new()}}{
Initialize the OnlineLDA model with specified parameters.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OnlineLDA$new(
  vocab,
  K,
  N,
  alpha = NULL,
  eta = NULL,
  tau0 = 9,
  kappa = 0.7,
  zeta = 0,
  iter_inner = 50,
  tol = 1e-04,
  iter_gamma = 10,
  verbose = 0,
  seed = NULL
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{vocab}}{A vector of terms (the vocabulary).}

\item{\code{K}}{Number of topics.}

\item{\code{N}}{Total number of tokens across all documents.}

\item{\code{alpha}}{Initial document-topic distribution prior. Default is \code{1/K}.}

\item{\code{eta}}{Initial topic-word distribution prior. Default is \code{1/K}.}

\item{\code{tau0}}{Delay parameter for learning rate.}

\item{\code{kappa}}{Learning rate exponent.}

\item{\code{zeta}}{Regularization parameter.}

\item{\code{iter_inner}}{Maximum number of iterations for the inner optimization loop.}

\item{\code{tol}}{Convergence tolerance for the optimization.}

\item{\code{iter_gamma}}{Maximum number of iterations for gamma optimization.}

\item{\code{verbose}}{Verbosity level.}

\item{\code{seed}}{Random seed for reproducibility.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-OnlineLDA-init_global_parameter"></a>}}
\if{latex}{\out{\hypertarget{method-OnlineLDA-init_global_parameter}{}}}
\subsection{Method \code{init_global_parameter()}}{
Initialize global parameters.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OnlineLDA$init_global_parameter(m_lambda = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{m_lambda}}{Optional lambda parameter to initialize, otherwise it uses random values.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-OnlineLDA-do_e_step"></a>}}
\if{latex}{\out{\hypertarget{method-OnlineLDA-do_e_step}{}}}
\subsection{Method \code{do_e_step()}}{
Perform the E-step of the algorithm on a batch.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OnlineLDA$do_e_step(batch)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{batch}}{A list containing the current batch of data for training.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-OnlineLDA-update_lambda"></a>}}
\if{latex}{\out{\hypertarget{method-OnlineLDA-update_lambda}{}}}
\subsection{Method \code{update_lambda()}}{
Update lambda parameter based on a batch.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OnlineLDA$update_lambda(batch)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{batch}}{A list containing the current batch of data for training.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-OnlineLDA-approx_score"></a>}}
\if{latex}{\out{\hypertarget{method-OnlineLDA-approx_score}{}}}
\subsection{Method \code{approx_score()}}{
Compute approximate scores for the model based on a batch.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OnlineLDA$approx_score(batch)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{batch}}{A list containing the current batch of data.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-OnlineLDA-clone"></a>}}
\if{latex}{\out{\hypertarget{method-OnlineLDA-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OnlineLDA$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
