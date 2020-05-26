# Katsuyou / 活用 (lit. "Conjugation")

An API for conjugating Japanese words

## Installation

Stick this in your Gemfile and 吸う it:

```
gem "katsuyou"
```

## Usage

### `Katsuyou.conjugate(word, type:)`

This gem generates conjugations for ichidan ("る") and godan ("う") verbs, as
well as the two notable exceptions in suru (する) and kuru (来る). Other verbs
exist (like [nidan
verbs](https://en.wiktionary.org/wiki/Category:Japanese_nidan_verbs)), but as
they're (apparently, I'm no expert) archaisms, I didn't bother implementing
them.

``` ruby
Katsuyou.conjugate("食べる", type: :ichidan_verb)
Katsuyou.conjugate("聞く", type: :godan_verb)
Katsuyou.conjugate("学ぶ", type: "v5b")

# Our special cases
Katsuyou.conjugate("する", type: :suru_verb)
Katsuyou.conjugate("勉強", type: :suru_verb)
Katsuyou.conjugate("来る", type: :kuru_verb)
```

(By the way, if you're not sure what type of verb a given word is, consult a
[primer on verb
groups](https://www.tofugu.com/japanese-grammar/verb-conjugation-groups/) and a
[dictionary](https://jisho.org) to be sure)

And you'll get back a [Struct](https://ruby-doc.org/core-2.7.0/Struct.html)
subclass containing a number of conjugated forms:

```ruby
conjugations = Katsuyou.conjugate("見せる", type: :ichidan_verb)

#  #<struct Katsuyou::VerbConjugation
#   conjugation_type=
#    #<struct Katsuyou::ConjugationType
#     code="v1",
#     description="Ichidan verb",
#     category=:ichidan_verb,
#     supported=true>,
#   present="見せる",
#   present_polite="見せます",
#   present_negative="見せない",
#   present_negative_polite="見せません",
#   past="見せた",
#   past_polite="見せました",
#   past_negative="見せなかった",
#   past_negative_polite="見せませんでした",
#   conjunctive="見せて",
#   conjunctive_polite="見せまして",
#   conjunctive_negative="見せなくて",
#   conjunctive_negative_polite="見せませんで",
#   provisional="見せれば",
#   provisional_negative="見せなければ",
#   volitional="見せよう",
#   volitional_polite="見せましょう",
#   imperative="見せろ",
#   imperative_negative="見せるな",
#   potential="見せられる",
#   potential_polite="見せられます",
#   potential_negative="見せられない",
#   potential_negative_polite="見せられません",
#   passive="見せられる",
#   passive_polite="見せられます",
#   passive_negative="見せられない",
#   passive_negative_polite="見せられません",
#   causative="見せさせる",
#   causative_polite="見せさせます",
#   causative_negative="見せさせない",
#   causative_negative_polite="見せさせません",
#   causative_passive="見せさせられる",
#   causative_passive_polite="見せさせられます",
#   causative_passive_negative="見せさせられない",
#   causative_passive_negative_polite="見せさせられません">
```

### `Katsuyou.conjugatable?(word, type:)`

If you're not sure whether a particular word & type is supported, you can ask
first with `conjugatable?` (note that `conjugate()` will raise if a conjugation
type is unsupported or unknown)

```
Katsuyou.conjugatable?("食べる", type: :ichidan_verb) # => true
Katsuyou.conjugatable?("買う", type: "v5u") # => true
Katsuyou.conjugatable?("食", type: :ichidan_verb) # => false, all ichidan verbs end in る
Katsuyou.conjugatable?("ぷす", type: "v9s") # => false, unknown type "v9s"
```

### Conjugation types

The `conjugate(text, type:)` method **requires** you to supply a `type` value.
There are two categories of values that the gem accepts.

#### General conjugation types

First, as illustarted at the outset, these _general_ conjugation types are
supported:

* `ichidan_verb` (e.g. 食べる)
* `godan_verb` (e.g. 買う)
* `kuru_verb` (e.g. 来る)
* `suru_verb` (namely, する but also nouns that can take する like 勉強)

If you provide one of the above conjugation types, the gem will attempt to
translate it to a more specific conjugation form, which are identified by the
same codes as listed under conjugate-able entries' parts of speech in
[JMDict/EDICT](http://www.edrdg.org/jmdict/edict_doc.html).

#### Specific conjugation codes

As a result of the preceding, if you're passing in values from a JMDict-based
dictionary, it probably makes more sense to pass the specific code (e.g.
`Katsuyou.conjugate("請う", type: "v5u-s")`) to ensure that you get the most
accurate results.

You can find codes the gem knows about in `Katsuyou::CONJUGATION_TYPES`.

For example to see the supported conjugation types:

```ruby
puts Katsuyou::CONJUGATION_TYPES.select(&:supported).map { |type| "#  • #{type.code}" }.join("\n")
#  • v1
#  • v1-s
#  • v5aru
#  • v5b
#  • v5g
#  • v5k
#  • v5k-s
#  • v5m
#  • v5n
#  • v5r
#  • v5r-i
#  • v5s
#  • v5t
#  • v5u
#  • v5u-s
#  • vk
#  • vs
#  • vs-s
#  • vs-i
```

And likewise, for the known-but-unsupported ones:

```ruby
puts Katsuyou::CONJUGATION_TYPES.reject(&:supported).map { |type| "#  • #{type.code}" }.join("\n")
#  • adj-i
#  • adj-na
#  • adj-t
#  • adv-to
#  • aux
#  • aux-v
#  • aux-adj
#  • v2a-s
#  • v4h
#  • v4r
#  • v5uru
#  • vz
#  • vn
#  • vr
#  • vs-c
```
