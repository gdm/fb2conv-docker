# FB2Conv

fb2conv converts fb2 files into the mobi format for Kindle.

- Project URL: [fb2conv](http://www.the-ebook.org/forum/viewtopic.php?t=28447&postdays=0&postorder=asc&start=0) (russian)
- Tool description: [Мягкие переносы в книгах на Kindle Paperwhite](http://ctrld.me/blog/2014/11/12/soft-hyphen-kindle-paperwhite/) (russian)

Build:

    make

Run:

    docker run -it --rm -v /Users/ctrld/Downloads:/data -v ~/.fb2conv/fb2conv.config.s:/root/.fb2conv/fb2conv.config fb2conv book.fb2.zip

Directories in container:

- /data - directory with book.fb2.zip file
- /root/.fb2conv/fb2conv.config - config file

For example, book.fb2.zip must be located in /Users/ctrld/Downloads/book.fb2.zip, this directory is mapped to /data/book.fb2.zip

Config file example (~/.fb2conv/fb2conv.config.s):

    <?xml version='1.0' encoding='utf-8'?>
    <settings>
      <debug>True</debug>
      <logFile/>
      <logLevel>Info</logLevel>
      <outputFormat>mobi</outputFormat>
      <kindleCompressionLevel>1</kindleCompressionLevel>
      <noDropcapsSymbols>'"-.…0123456789‒–—«»</noDropcapsSymbols>
      <transliterate>True</transliterate>
      <defaultProfile>default</defaultProfile>
      <profiles>
        <profile description="Профиль по-умолчанию" name="default">
          <hyphens>True</hyphens>
          <dropcaps>False</dropcaps>
          <tocMaxLevel>1000</tocMaxLevel>
          <tocBeforeBody>False</tocBeforeBody>
          <flatTOC>True</flatTOC>
          <css parse="True">profiles/default.css</css>
          <chapterOnNewPage>True</chapterOnNewPage>
          <authorFormat>#f #l</authorFormat>
          <bookTitleFormat>#title</bookTitleFormat>
          <annotationTitle>Аннотация</annotationTitle>
          <tocTitle>Содержание</tocTitle>
          <notesMode>inline</notesMode>
          <notesBodies>notes</notesBodies>
          <generateTOCPage>True</generateTOCPage>
          <generateAnnotationPage>True</generateAnnotationPage>
          <generateOPFGuide>True</generateOPFGuide>
          <kindleRemovePersonalLabel>True</kindleRemovePersonalLabel>
          <vignettes/>
        </profile>
      </profiles>
      <sendToKindle>
        <send>True</send>
        <deleteSendedBook>True</deleteSendedBook>
        <smtpServer>smtp.gmail.com</smtpServer>
        <smtpPort>465</smtpPort>
        <smtpLogin>change_it@gmail.com</smtpLogin>
        <smtpPassword>change_it</smtpPassword>
        <fromUserEmail>change_it@gmail.com</fromUserEmail>
        <toKindleEmail>kindle_email_change_it@kindle.com</toKindleEmail>
      </sendToKindle>
      <guiSettings>
        <lastUsedProfile>default</lastUsedProfile>
        <lastUsedFormat>mobi</lastUsedFormat>
        <outputFolder>/Users/ctrld/Downloads</outputFolder>
        <convertToSourceDirectory>False</convertToSourceDirectory>
        <geometry>
          <x>41</x>
          <y>92</y>
          <width>717</width>
          <height>475</height>
        </geometry>
      </guiSettings>
    </settings>
