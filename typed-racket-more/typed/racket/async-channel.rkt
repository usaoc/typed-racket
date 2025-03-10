#lang s-exp typed-racket/base-env/extra-env-lang

;; This module provides a typed version of racket/async-channel

(require racket/async-channel
         (for-syntax (only-in typed-racket/rep/type-rep -Async-ChannelTop)))

;; Section 11.2.4 (Buffered Asynchronous Channels)
(type-environment
 [make-async-channel (-poly (a) (->opt [(-opt -PosInt)] (-async-channel a) :T+ #t))]
 [async-channel? (make-pred-ty -Async-ChannelTop)]
 [async-channel-get (-poly (a) ((-async-channel a) . -> . a :T+ #f))]
 [async-channel-try-get (-poly (a) ((-async-channel a) . -> . (-opt a) :T+ #f))]
 [async-channel-put (-poly (a) ((-async-channel a) a . -> . -Void :T+ #t))]
 [async-channel-put-evt (-poly (a) (-> (-async-channel a) a (-mu x (-evt x)) :T+ #f))])

