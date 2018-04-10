.. title:: Oldskool coding on Atari 2600/VCS

Oldskool coding on Atari 2600/VCS
=================================

* [TODO] Put a nice pic there

* Author: Florent Flament (contact@florentflament.com)

====

Context
=======

====

Demoscene
---------

* Computer art subculture

* Born in 1980s as "copyparties"

* Still dozens of demoparties every year

.. note::

   The demoscene is a form of computer art culture characterized by
   events called demoparties. These events gather tens to hundreds of
   participants (called demosceners or sceners), most of them
   participating to organized competitions (called compos). During
   these compos, groups of sceners present their so-called demos,
   consisting of animated drawings, effects, 3D models and musics put
   together programmatically and in real time. Although demoscene
   groups may have dozens of members, demos are usually made by small
   teams consisting of 2-4 people (for instance, a graphic artist, a
   musician and a coder). Most demoparties also host musics, graphics,
   and sometimes photos competitions.

   Demoparties originate from copyparties happening in the 1980s,
   where computer enthusiasts met together to copy (and crack)
   software. Cracker groups usually added a short intro (animated
   graphics with music) to the software they cracked. Later in the
   1980s, groups focusing on making demos, rather than cracking
   software appeared leading to a fork between the "crackscene" and
   the "demoscene". As of today, there are still dozens of demoparties
   happening (mostly in Europe - like the Revision, Evoke and Assembly
   parties) every year, usually gathering dozens to hundreds of
   participants (Revision 2018 hosted around 700 participants).

====

PC demos
--------

* Limited size demos (or intros)

* Unrestricted demos

* Shader showdown (live coding)

.. note::

   During demoparties, the two main categories of competitions are PC
   compos and oldskool compos.

   PC demos make heavily use of the latest graphic cards' hardware
   capabilities, to display real time animated 3D scenes with effects
   involving millions of polygons and/or particles.

   Among PC compos, we can find "limited size demos (or intros)". The
   rule is quite simple. To participate in such compo, the size of the
   demos submitted (usually binary files) must be smaller or equal to
   the size limit set for the competition. Usual sizes vary between 4k
   (4 KiloBytes) and 64K. Most of these demos heavily rely on
   procedural graphics, i.e graphics that are created in real time
   based on mathematical functions. This avoids storing to many 3D
   models, which are usually expensive in term of data size. In 64K
   demos, a limited amount of 3D models may be used, in which case
   powerful compression tools (the most well known being Crinkler_)
   are used to save space.

   Then we have the so-called "PC demos", which aren't constrained,
   though they must still be rendered in real time. Most of these
   demos are made using frameworks, like Unity_ (a commercial software
   meant to build video games), Notch_ (a tool developped and
   commercialized by Fairlight, a famous demoscene group, to build
   demos and visuals) or custom frameworks. These demos are mostly
   driven by visual artists who are able to create deep, beautiful and
   original 3D scenes.

   Eventually, some parties (like Revision_) host so-called shader
   showdown shows. These consist in live coding performances where two
   programmers compete during 25 minutes to build the best demo-like
   visual, solely relying on the "fragment shader" capability of the
   compo machine graphic card. The principle of these shaders,
   programmed in GLSL (a C-like language compiled by the graphic card
   driver into a bytecode interpreted by the GPU), is that the image
   or scene being displayed is computed in real time pixel per pixel,
   in parallel, as modern graphic cards have thousands of computing
   units. The most widely used technique to program these shaders is
   called ray marching, as it allows to quickly create sophisticated
   3D scenes. Communities around shaders have emerged and code is
   being shared on websites like Shadertoy_ (the most widely known).

====

Oldskool demos
--------------

* Platform constraints (8bit or 16bit)

* Limited vs Unlimited size oldskool demos

* Per platform compos

.. note::

   On the other side of the spectrum, we have the oldskool
   demos. These are made for 8bit or 16bit computers (like the
   Commodore 64, the Atari ST or the Amiga 500) and game consoles
   (like the Atari 2600/VCS, the Nintendo Famicom or the Sega
   Megadrive). Most of these machines have been commercialized in the
   1980s and early 1990s, and have much less capabilities than modern
   PCs. Demos have been made on these platforms since the 1980s, when
   demosceners mostly focused on pushing them as far as they could in
   order to produce the most astonishing effect. Nowadays, the focus
   on these platforms has shifted; they are being used for the
   challenge of making a beautiful and original production (usually
   coded in assembler), while complying with these platforms'
   constraints (limited colors, graphic resolution, sound capability,
   memory and computing power). Another goal is to make these
   platforms live and avoid them to be forgotten.

   Depending on the demoparty, there may be several categories where
   oldskool demos are competing. In generalist demoparties (like
   Revision and Evoke), all the oldskool platforms are regrouped into
   a single "oldskool" category (constrained by the size of the
   platform's medium, i.e one or two disks). Some parties propose
   limited size compos, like the oldskool 4K intro compo of the
   Revision party. However, the overall difference between a 4K
   oldskool intro and an unconstrained oldskool demo is much less
   significant than between size limited and unconstrained PC
   demos. As we have seen previously, the size limitation in the PC
   world has for consequence a completely different approach in the
   way a demo is made. In the oldskool world, 4K intros are relatively
   similar to unconstrained demos, although being shorter, involving
   only one or a few effects, and without high resolution graphics.

   That said, there is a drawback in parties having a single oldskool
   demo category. Oldskool platforms have very different capabilities,
   and these demos are not always judged by taking into account the
   constraints of the platform they are running on. For instance, the
   Atari 2600/VCS, commercialized in 1977, has 128 bytes of RAM, a
   1MHz 8bit CPU, a very basic sound chip producing mostly untuned
   notes, and a very basic video chip, that needs to be updated at
   every scanline (i.e hundreds of times per second) in order to
   produce rich graphics, therefore consuming most of the CPU power
   just for doing the display. On the other hand, the Atari ST,
   commercialized in 1985, has 512 KBytes to 4 MBytes of RAM, a 8MHz
   16bit CPU, a pretty good sound chip and a video frame buffer. For
   these reasons, in more specialized parties like the `Silly
   Venture`_, focusing on Atari platforms, we can find per platform
   competitions (Atari 2600/VCS, Atari 8bit, Atari ST, Atari Falcon),
   though there may be less entries per compo.

====

Community
---------

* Almost every demos are available on Pouet and Demozoo

* Events streamed through Twitch

* Scenesat.tv

.. note::

   The demoscene is a very tight community. In addition to the many
   demo parties organized every year, a lot of (smaller) local events
   happen in some cities (Beetros where demosceners meet to drink a
   beer, or demoscene related conferences and events).

====

Atari 2600/VCS
==============

Specifications
--------------

Graphics coding
---------------

Music coding
------------

####


Team collaboration
==================

Team members
------------

Collaboration tools
-------------------

Collaboration process
---------------------

####

Atari VCS demos
===============

.. _Crinkler: http://crinkler.net/
